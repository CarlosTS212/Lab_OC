#include <stdio.h>
#include <stdint.h>
extern void pBin8b (uint8_t);
extern void pBin16b (uint16_t);
extern void pBin32b (uint32_t);
extern void pBin64b (uint64_t);


int main()
{
    uint8_t val8 = 136;
    uint16_t val16 = 513;
    uint32_t val32 = 2290649224;
    uint64_t val64 = 983826350597842;

    
    pBin8b (val8);
    printf("\n");
   pBin16b (val16);
    printf("\n");
    pBin32b (val32);
    printf("\n");
    pBin64b (val64);
    printf("\n");

    
}