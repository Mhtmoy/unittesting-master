#include "eqp.h"
#include <gtest/gtest.h>


TEST(TestEquation, positiveRange) {
  Equation e;

  ASSERT_NEAR(e.calculate(5), 4.2915, 0.0001);
  }

TEST(TestEquation, assertRange) {
    Equation e;
    ASSERT_NEAR(e.calculate(11), 11.50175, 0.0001);
}

class EquationTest : public ::testing::Test {

public:
  Equation* eq;
  void SetUp() {
    eq = new Equation();
  }

  void TearDown() {
    delete eq;
  }
};

TEST_F(EquationTest, invalidRange) {
  EXPECT_THROW(eq->calculate(0), result_undefined_error);
}

TEST_F(EquationTest, invalidRange2) {
  EXPECT_NEAR(eq->calculate(5), 5.2915, 0.0001);
}
