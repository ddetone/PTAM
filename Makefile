# DO NOT DELETE THIS LINE -- make depend depends on it.


# Edit the lines below to point to any needed include and link paths
# Or to change the compiler's optimization flags
CC = g++ -g
COMPILEFLAGS = -I MY_CUSTOM_INCLUDE_PATH -D_LINUX -D_REENTRANT -Wall  -O3 -march=nocona -msse3
LINKFLAGS = -L MY_CUSTOM_LINK_PATH -lGVars3 -lcvd -llapack -lblas

# Edit this line to change video source
VIDEOSOURCE = VideoSource_File.o

OBJECTS=	main.o\
		GLWindow2.o\
		GLWindowMenu.o\
		$(VIDEOSOURCE)\
		System.o \
		ATANCamera.o\
		KeyFrame.o\
		MapPoint.o\
		Map.o\
		SmallBlurryImage.o\
		ShiTomasi.o \
		HomographyInit.o \
		MapMaker.o \
		Bundle.o \
		PatchFinder.o\
		Relocaliser.o\
		MiniPatch.o\
		MapViewer.o\
		ARDriver.o\
		EyeGame.o\
		Tracker.o

All: PTAM

PTAM: $(OBJECTS)
	$(CC) -o PTAM.exe $(OBJECTS) $(LINKFLAGS)

%.o: %.cc
	$(CC) $< -o $@ -c $(COMPILEFLAGS)

clean:
	rm *.o


depend:
	rm dependecies; touch dependencies
	makedepend -fdependencies $(INCLUDEFLAGS) $(MOREINCS) *.cc *.h


-include dependencies









