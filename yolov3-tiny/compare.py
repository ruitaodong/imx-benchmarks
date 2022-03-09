from glob import glob
import json
from PIL import Image
import fiona

dmor = json.load(open('jsonDMQR.json'))

dmor_dict = dict({d.pop('filename'):d for d in dmor})
qr_dict = dict()

decoded=glob('DMQR_decoded/OC*.txt')
#decoded=glob('DMQR_decoded/OCR5MP02282.txt')

for t in decoded:
    lines=[l for l in open(t)]
    if not lines:
        continue

    t_png = t.replace('.txt', '.png')
    t_base = t_png.rsplit('/', 1)[-1]
    if not t_base in dmor_dict:
        continue

    prop = dmor_dict[t_base]
    if not 'QR' == prop['type']:
        continue

    with Image.open(t_png) as im:
        width, height = im.size

    properties = {'score':'float:0.3'}

    t_json = t.replace('.txt', '-yolov3-tiny.json')
    #print(t_json)
    with fiona.open(t_json, 'w', driver='GeoJSON',
                    schema = {'geometry': 'Polygon', 'properties': properties}) as j:
        for l in lines:
            _, x, y, w, h, s = map(float, l.strip().split(' '))
            x *= width
            y *= height
            w *= width
            h *= height
            j.write({'geometry': {'type': 'Polygon', 'coordinates':
                                  [[(x-w/2,-y+h/2), (x-w/2, -y-h/2), (x+w/2, -y-h/2), (x+w/2, -y+h/2), (x-w/2,-y+h/2)]]},
                     'type': 'feature',
                     'properties': {'score': s}})
