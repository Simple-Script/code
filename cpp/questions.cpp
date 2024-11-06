#include <iostream>
#include <string>

int main() {
    std::string questions[3] = {
        "What is 1 + 0?\n",
        "What is 1 + 1?\n",
        "What is 1 + 2?\n"
    };
    int correctAnswers[3] = {1, 2, 3};
    int userAnswers[3];
    int score = 0;

    for (int i = 0; i < 3; i++) {
        std::cout << questions[i];
        std::cin >> userAnswers[i];
        if (userAnswers[i] == correctAnswers[i]) {
            score++;
        }
    }

    double percentage = (score / 3.0) * 100;
    std::cout << "You got " << score << " out of 3 correct. Your score is " << percentage << "%.\n";

    return 0;
}
