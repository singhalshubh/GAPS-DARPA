CC          ?= gcc
AR          ?= ar
LIB_OBJ     = $(OBJDIR)/float754.o $(OBJDIR)/codec.o 

OBJDIR ?= .
CFLAGS      = -O2 -Wall -Wstrict-prototypes

autogen: example1.idl
	python3 ~/gaps/build/src/hal/autogen/autogen.py -i example1.idl -g bw_v1 -d example1_bw.dfdl -e codec
	python3 ~/gaps/build/src/hal/autogen/autogen.py -i example1.idl -g be_v1 -d example1_be.dfdl -e codec

libraries: slibs libs

$(OBJDIR)/libcodecs.a: $(LIB_OBJ)
	ar rcs $@ $^

$(OBJDIR)/libcodecs.so: $(LIB_OBJ)
	$(CC) $(CFLAGS) -fPIC -shared -o $@ $<

libs: $(OBJDIR)/libcodecs.a 

slibs: $(OBJDIR)/libcodecs.so 

$(OBJDIR)/%.o:	%.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o $(OBJDIR)/*.a $(OBJDIR)/*.so $(OBJDIR)/*~ *.c *.h *.dfdl

