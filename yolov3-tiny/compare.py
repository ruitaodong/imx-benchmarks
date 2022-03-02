from glob import glob
import json
from PIL import Image

dmor = json.load(open('jsonDMQR.json'))

dmor_dict = dict({d.pop('filename'):d for d in dmor})

decoded=glob('DMQR_decoded/OC*.txt')

for t in decoded:
    t_png = t.replace('.txt', '.png')
    t_base = t_png.rsplit('/', 1)[-1]
    if t_base in dmor_dict:
        with im = Image.open(t_png):
            width, height = im.size
            
        dmor_dict[t_base]['yolov3_tiny'] = [list(map(float, l.strip().split(' ')[1:])) for l in open(t)]
        if len(dmor_dict[t_png]['yolov3_tiny']) != 1:
            print(t_png, len(dmor_dict[t_png]['yolov3_tiny']))


#json.dump(dmor_dict, open('yolov3-tiny.json', 'w'), indent=2)        
        


        
    
    
    
    
