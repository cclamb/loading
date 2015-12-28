#include <dlfcn.h>
#include <stdio.h>

#define OK      1
#define FAIL    0
#define LIBNAME "./libprtr.so.1.0"
#define FUNAME  "print"

int main(int argc, char *argv[]) {
    void *handle            = NULL;
    void (*printer)(void)    = NULL;
    int result              = 0;

    handle = dlopen(LIBNAME, RTLD_LAZY);
    if (handle == NULL) {
        printf("Error opening library: %s\n", dlerror());
        return FAIL;
    }

    *(void **) (&printer) = dlsym(handle, FUNAME);
    if (printer == NULL) {
        printf("Error opening function: %s\n", dlerror());        
        return FAIL;
    }

    (*printer)();

    if (dlclose(handle)) {
        printf("Error closing library: %s\n", dlerror());
        return FAIL;
    }

    return OK;
}
