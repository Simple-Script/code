#include <stdio.h>
#include <stdlib.h>

int main() {
    const char *path = "C:\\path\\to\\your\\executable.exe";
    int result = system(path);
    
    if (result == -1) {
        perror("Error executing the program");
        return EXIT_FAILURE;
    }
    
    return EXIT_SUCCESS;
}
