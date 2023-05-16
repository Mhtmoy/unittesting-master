PROGRAM_TEST = testEquation

# Compilation command and flags
CXX=g++
CXXVERSION= -std=c++11
CXXFLAGS= $(CXXVERSION)
LINKFLAGS= -lgtest

# Directories
GTEST_DIR = test
SRC_INCLUDE = include
INCLUDE = -I ${SRC_INCLUDE}

# Default goal, used by Atom for local compilation
.DEFAULT_GOAL := tests

# default rule for compiling .cc to .o
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# clean up all files that should NOT be submitted
.PHONY: clean
clean:
	rm -rf *~ $(SRC)/*.o *.o $(GTEST_DIR)/output/*.dat \
	*.gcov *.gcda *.gcno *.orig ???*/*.orig \
	$(PROJECT) $(COVERAGE_RESULTS) \
	$(GTEST) $(MEMCHECK_RESULTS) $(COVERAGE_DIR)  \
	$(DOXY_DIR)/html obj bin $(PROGRAM_TEST_CLEAN).exe
	$(PROGRAM_TEST_BUGS).exe

$(PROGRAM_TEST): $(GTEST_DIR)
		$(CXX) $(CXXFLAGS) -o $(PROGRAM_TEST) $(INCLUDE) \
		$(GTEST_DIR)/*.cpp $(LINKFLAGS)

# To perform unit tests
tests: $(PROGRAM_TEST)
	$(PROGRAM_TEST)
