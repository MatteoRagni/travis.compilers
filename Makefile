TARGET = test.out
OBJECTS = $(patsubst %.cpp, %.o, $(wildcard *.cpp))
HEADERS = $(wildcard *.h)

.PHONY: default all clean version ci

default: $(TARGET)

ci: version all

all: default

version:
	@echo "--- VERSION  ---"
	@$(CXX) --version
	@echo "--- VERSION END ---"

%.o: %.cpp $(HEADERS)
	$(CXX) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)