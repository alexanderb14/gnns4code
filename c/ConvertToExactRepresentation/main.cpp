#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/InitializePasses.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/PrettyStackTrace.h"
#include "llvm/Support/Signals.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Format.h"
#include <iterator>
#include <vector>
#include <iostream>

#include <string>
#include <llvm/Support/Format.h>



using namespace llvm;
using std::string;

void convertToExactRepresentation(Constant *CV, raw_string_ostream &Out);

int main(int argc, char **argv) {
    string value = argv[1];
    string boolString = argv[2];
    bool isDouble = true;
    if (boolString == "false"){
        isDouble = false;
    }
    auto a = new LLVMContext();
    Type* type;
    string buf;
    Constant* constant;
    if(isDouble) {
        type = Type::getDoubleTy(*a);
        constant = ConstantFP::get(type, std::atof(argv[1]));
    }
    else{
        type = Type::getInt64Ty(*a);

        constant = ConstantInt::get(type, std::atol(argv[1]));
    }
    raw_string_ostream out(buf);
    convertToExactRepresentation(cast<Constant>(constant), out);
    buf = out.str();
    std::cout << buf << std::endl;
}

void convertToExactRepresentation(Constant *CV, raw_string_ostream &Out){
    if (const ConstantInt *CI = dyn_cast<ConstantInt>(CV)) {
        if (CI->getType()->isIntegerTy(1)) {
            Out << (CI->getZExtValue() ? "true" : "false");
            return;
        }
        Out << CI->getValue();
        return;
    }

    if (const ConstantFP *CFP = dyn_cast<ConstantFP>(CV)) {
        const APFloat &APF = CFP->getValueAPF();
        if (&APF.getSemantics() == &APFloat::IEEEsingle() ||
            &APF.getSemantics() == &APFloat::IEEEdouble()) {
            // We would like to output the FP constant value in exponential notation,
            // but we cannot do this if doing so will lose precision.  Check here to
            // make sure that we only output it in exponential format if we can parse
            // the value back and get the same value.
            //
            bool ignored;
            bool isDouble = &APF.getSemantics() == &APFloat::IEEEdouble();
            bool isInf = APF.isInfinity();
            bool isNaN = APF.isNaN();
            if (!isInf && !isNaN) {
                double Val = isDouble ? APF.convertToDouble() : APF.convertToFloat();
                SmallString<128> StrVal;
                APF.toString(StrVal, 6, 0, false);
                // Check to make sure that the stringized number is not some string like
                // "Inf" or NaN, that atof will accept, but the lexer will not.  Check
                // that the string matches the "[-+]?[0-9]" regex.
                //
                assert(((StrVal[0] >= '0' && StrVal[0] <= '9') ||
                        ((StrVal[0] == '-' || StrVal[0] == '+') &&
                         (StrVal[1] >= '0' && StrVal[1] <= '9'))) &&
                       "[-+]?[0-9] regex does not match!");
                // Reparse stringized version!
                if (APFloat(APFloat::IEEEdouble(), StrVal).convertToDouble() == Val) {
                    Out << StrVal;
                    std::string a;
                    raw_string_ostream o(a);
                    o << StrVal;
                    a = o.str();
                    return;
                }
            }
            // Otherwise we could not reparse it to exactly the same value, so we must
            // output the string in hexadecimal format!  Note that loading and storing
            // floating point types changes the bits of NaNs on some hosts, notably
            // x86, so we must not use these types.
            static_assert(sizeof(double) == sizeof(uint64_t),
                          "assuming that double is 64 bits!");
            APFloat apf = APF;
            // Floats are represented in ASCII IR as double, convert.
            if (!isDouble)
                apf.convert(APFloat::IEEEdouble(), APFloat::rmNearestTiesToEven,
                            &ignored);
            Out << format_hex(apf.bitcastToAPInt().getZExtValue(), 0, /*Upper=*/true);
            return;
        }
    }
}