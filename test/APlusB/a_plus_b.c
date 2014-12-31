#include 

static int iOffset = 0;

static int iLastA  = 0;

int iAPlusB( int a, int b)
{
  iLastA = a;
  return a + b + iOffset;
}


int main( int argc, char* argv[])
{
  return 0;
}