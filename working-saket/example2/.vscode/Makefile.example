MYLIB=-L$(CLOSURE_LIBS) -lxdcomms ../autogen/libcodecs.a -lzmq

APPSRC=$(wildcard *.c)
APPOBJ=$(patsubst %.c, %.o, $(APPSRC)) 
APPEXE=${PROG}
APPLL=$(patsubst %.c, %.ll, $(APPSRC))

CFLAGS += -g -I/usr/include/python3.8
PYFLAGS = `python3-config --ldflags --libs`

CFLAGS += -D__LEGACY_XDCOMMS__=1 -I$(CLOSURE_INCLUDES) -I../autogen

$(APPEXE): $(APPOBJ)
	clang $(CFLAGS) -o $@ $^ $(MYLIB) $(PYFLAGS)

clean:
	rm -f $(APPEXE) $(APPOBJ) $(APPLL)

realclean:
	rm -f $(APPEXE) $(APPOBJ) $(APPLL)

.SECONDARY:

%.o: %.c
	clang -c $(CFLAGS) $< -o $@
