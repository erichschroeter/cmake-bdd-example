#include <gtest/gtest.h>
#include <cucumber-cpp/autodetect.hpp>

#include <calc.h>

using cucumber::ScenarioScope;

struct CalcCtx
{
	int first;
	int second;
};

GIVEN("^I have a calculator")
{
	ScenarioScope<CalcCtx> context;
	context->first = 0;
	context->second = 0;
}

