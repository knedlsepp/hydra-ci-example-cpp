all:
	$(CXX) --std=c++11 main.cpp -o helloworld
check:
	./helloworld