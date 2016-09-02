# magpi_parallel1
Files for MagPi 50 article 'Introduction to parallel programming'

This example shows how the make utility can be used to distribute work
over multiple cores for certain tasks.

Starting with a set of existing images, we are going to make a collage
of thumbnails for all the images.  This is a task that might be
repeated as the set of source images changes or is updated.  We want
to use all four cores of a Raspberry Pi 2 or 3 if possible.  Each
thumbnail can be generated independently, so up to four can be
generated at any one time.  Once all the thumbnails are ready, the
collage is made from them.

The make utility will automatically distribute the work required over
the four available cores.  Place your original images inside the
fullsize directory and then type

make -j4

which starts make and tells it to run up to four jobs simultaneously.

The rules that make this possible are given inside the Makefile.
