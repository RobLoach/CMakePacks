// Umka embedded scripting example (original raylib example by Ramon Santamaria) 

#include <stdio.h>
#include "umka_api.h"

void printMessage(UmkaStackSlot *params, UmkaStackSlot *result) {
    const char* message = (const char*)params[0].ptrVal;      
    printf("Message: %s\n", message);
}

int main(void) {
    void *umka = umkaAlloc();
    const char* code = "fn print(message: str)\nfn main() {\n  print(\"Hello, World!\")\n  print(\"How are you?\")\n}";
    bool umkaOk = umkaInit(umka, NULL, code, 1024 * 1024, NULL, 0, NULL, false, false, NULL);
    
    if (umkaOk) {
        if (umkaAddFunc(umka, "print", &printMessage)) {
            umkaOk = umkaCompile(umka);
        }
        else {
            umkaOk = false;
        }
    }

    if (umkaOk) {
        int mainCall = umkaGetFunc(umka, NULL, "main");
        umkaOk = umkaCall(umka, mainCall, 0, NULL, NULL);
    }

    if (!umkaOk) {
        UmkaError error;
        umkaGetError(umka, &error);
        printf("Umka error %s (%d, %d): %s\n", error.fileName, error.line, error.pos, error.msg);
    }

    umkaFree(umka);
        
    return 0;
}