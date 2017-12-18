# please install Pillow Package by pip[3] install Pillow
from PIL import Image

image = Image.open("./TestData/girl.jpg")

# print image information
print(image.format, image.size, image.mode)

#gen a thumbnail
image.thumbnail((320,240))
image.show() # show image by system default image viewer

# save as file
image.save("TestData/girl_thumbnail.jpg", "png")

import sys

# print the python moudule searching path
print(sys.path)

# add a path to system path, it can make your moudle find by "import"
sys.path.append("./YourModulePath")
