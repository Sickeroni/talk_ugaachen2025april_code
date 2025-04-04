#include <cstdint>

#include "inside_redir.hpp"
#include <outside_redir.hpp>

int main() {
    volatile uint8_t fake_out = 42;
    Inside inside{};
    Outside outside{};
}