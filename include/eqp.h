#include <stdexcept>
#include <cmath>

class result_undefined_error : public std::runtime_error {
public:
  result_undefined_error(const char* errMessage) :
    std::runtime_error(errMessage) {}
};

class Equation {
public:
  double calculate(double x) {
    if (x < -2 || x > 1) {
      return sqrt((x-1) * (x +2));
    }
    throw result_undefined_error("The result would be undefined!");
  }
};
