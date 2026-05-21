// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#include "vm/globals.h"
#if defined(TARGET_ARCH_LOONG64)

#include "vm/compiler/assembler/assembler.h"
#include "vm/compiler/assembler/assembler_test.h"
#include "vm/object.h"
#include "vm/unit_test.h"

namespace dart {
namespace compiler {

#define __ assembler->

// Called from assembler_test.cc.
// A0: value.
// A1: growable array.
// A2: current thread.
ASSEMBLER_TEST_GENERATE(StoreIntoObject, assembler) {
  __ PushRegister(RA);
  __ PushNativeCalleeSavedRegisters();

  __ MoveRegister(THR, A2);
  __ RestorePinnedRegisters();
  __ StoreIntoObject(A1, FieldAddress(A1, GrowableObjectArray::data_offset()),
                     A0);

  __ PopNativeCalleeSavedRegisters();
  __ PopRegister(RA);
  __ Ret();
}

void EnterTestFrame(Assembler* assembler) {
  __ EnterFrame(0);
  __ PushRegister(CODE_REG);
  __ PushRegister(THR);
  __ PushRegister(PP);
  __ MoveRegister(CODE_REG, A0);
  __ MoveRegister(THR, A1);
  __ RestorePinnedRegisters();
  __ LoadPoolPointer(PP);
}

void LeaveTestFrame(Assembler* assembler) {
  __ PopRegister(PP);
  __ PopRegister(THR);
  __ PopRegister(CODE_REG);
  __ LeaveFrame();
}

intptr_t RegRegImmTests::Lsl(intptr_t value, intptr_t shift, OperandSize sz) {
  return ExtendValue(static_cast<uintptr_t>(value) << shift, sz);
}

intptr_t RegRegImmTests::Asr(intptr_t value, intptr_t shift, OperandSize sz) {
  return ExtendValue(SignExtendValue(value, sz) >> shift, sz);
}

}  // namespace compiler
}  // namespace dart

#endif  // defined(TARGET_ARCH_LOONG64)
