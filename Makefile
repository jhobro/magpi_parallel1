# Thumbnail size in pixels
SIZE = 128x128

# The list of original photos to use (fullsize/* refers to all files
# in the directory fullsize)
ORIGINALS = $(wildcard fullsize/*)

# Use the list of originals to build a list of thumbnails (this takes
# the list of originals and changes the prefix on each file from
# 'fullsize' to 'thumbs')
THUMBS = $(ORIGINALS:fullsize/%=thumbs/%)

# RULE 1: Generate each thumbnail from its original using the convert
# utility from ImageMagick, rotating the image if necessary
thumbs/% : fullsize/%
	convert $< -thumbnail $(SIZE) -auto-orient $@

# RULE 2: Combine all the thumbnails into the montage and display it
montage.jpeg: $(THUMBS)
	montage $(THUMBS) montage.jpeg
	display montage.jpeg &

# Clean up all thumbnails and delete the montage
clean:
	$(RM) thumbs/* montage.jpeg
