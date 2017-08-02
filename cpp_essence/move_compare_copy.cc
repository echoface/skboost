#include <string>
#include <functional>
#include <iostream>
#include <sys/time.h>
#include <cstdlib>
#include <vector>

int main(int argc, char** argv) {
  const std::string c = "The earliest form of English is called Old English or Anglo-Saxon (c. 550–1066 CE). Old English developed from a set of North Sea Germanic dialects originally spoken along the coasts of Frisia, Lower Saxony, Jutland, and Southern Sweden by Germanic tribes known as the Angles, Saxons, and Jutes. In the fifth century, the Anglo-Saxons settled Britain and the Romans withdrew from Britain. By the seventh century, the Germanic language of the Anglo-Saxons became dominant in Britain, replacing the languages of Roman Britain (43–409 CE): Common Brittonic, a Celtic language, and Latin, brought to Britain by the Roman occupation.[25][26][27] England and English (originally Ænglaland and Ænglisc) are named after the Angles.[28]";

  struct timeval start;
  struct timeval end;


  {
    gettimeofday(&start, NULL);
    long int ms_start = start.tv_sec*1000 + start.tv_usec/1000;

    std::vector<std::string> array_char;
    for (int i = 0; i < 1000000; i++) {
      array_char.push_back(std::move(c));
    }

    gettimeofday(&end, NULL);
    long int ms_end = end.tv_sec*1000 + end.tv_usec/1000;

    std::cout << "move assign spend:" <<  ms_end - ms_start << "(ms)" << std::endl;
  }

  {
    gettimeofday(&start, NULL);
    long int ms_start = start.tv_sec*1000 + start.tv_usec/1000;

    std::vector<std::string> array_char;
    for (int i = 0; i < 1000000; i++) {
      array_char.push_back(c);
    }

    gettimeofday(&end, NULL);
    long int ms_end = end.tv_sec*1000 + end.tv_usec/1000;

    std::cout << "assign spend:" <<  ms_end - ms_start << "(ms)" << std::endl;
  }
  return 0;
}
