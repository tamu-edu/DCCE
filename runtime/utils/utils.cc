
#include <string>
#include <sstream>
#include <vector>

void Split(const std::string& str, std::vector<std::string>& cont, char delim = ' ')
{
    std::stringstream ss(str);
    std::string token;
    //printf("debug4 - process line %s\n", str.c_str());
    while (std::getline(ss, token, delim)) {
        //printf("debug5 - token %s\n", token.c_str());
        cont.push_back(token);
    }
}
