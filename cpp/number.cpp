#include <iostream>
#include <thread>
#include <chrono>

void loadingBar(int duration) {
    for (int i = 0; i <= 100; i += 10) {
        std::cout << "\rLoading: " << i << "%";
        std::cout.flush();
        std::this_thread::sleep_for(std::chrono::milliseconds(duration));
    }
    std::cout << std::endl;
}

int main() {
    int userNumber;
    std::cout << "Think of a number then enter it: ";
    std::cin >> userNumber;

    loadingBar(500);

    std::cout << "The number you were thinking of is: " << userNumber << std::endl;

    return 0;
}
