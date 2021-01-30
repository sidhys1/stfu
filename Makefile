exec = output.out
sources = $(wildcard src/*.c)
objects = $(sources:.c=.o)
flags = -g

$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install: 
	make 
	cp ./output.out /user/local/bin/output	

clean:
	-rm *.out 
	-rm *.o
	-rm src/*.o