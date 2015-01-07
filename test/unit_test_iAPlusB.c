/*
 ******************************************************************************
 * global inputs
 ******************************************************************************
 */
int iOffset;
/*
 ******************************************************************************
 * global outputs
 ******************************************************************************
 */
int iLastA;
/*
 ******************************************************************************
 * unit to be test
 * extract from ./APlusB/a_plus_b.c
 ******************************************************************************
 */


int iAPlusB( int a, int b)
{
  iLastA = a;
  return a + b + iOffset;
}

/*
 ******************************************************************************
 * tests of unit
 ******************************************************************************
 */
static int unit_test__0____iOffset_S1__iA_S1000__iB_0()
{
  int iC;
  iOffset = -1;
  iC = iAPlusB(  -1000, 0 );
  if ( iC != -1001 )
  {
    return 0;

  }
  if ( iLastA != -1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__1____iOffset_11__iA_S1000__iB_0()
{
  int iC;
  iOffset = 11;
  iC = iAPlusB(  -1000, 0 );
  if ( iC != -989 )
  {
    return 0;

  }
  if ( iLastA != -1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__2____iOffset_0__iA_S1001__iB_0()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  -1001, 0 );
  if ( iC != -1001 )
  {
    return 0;

  }
  if ( iLastA != -1001 )
  {
    return 0;

  }

return 1;

}


static int unit_test__3____iOffset_0__iA_1001__iB_0()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  1001, 0 );
  if ( iC != 1001 )
  {
    return 0;

  }
  if ( iLastA != 1001 )
  {
    return 0;

  }

return 1;

}


static int unit_test__4____iOffset_0__iA_S1000__iB_0()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  -1000, 0 );
  if ( iC != -1000 )
  {
    return 0;

  }
  if ( iLastA != -1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__5____iOffset_0__iA_0__iB_0()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  0, 0 );
  if ( iC != 0 )
  {
    return 0;

  }
  if ( iLastA != 0 )
  {
    return 0;

  }

return 1;

}


static int unit_test__6____iOffset_0__iA_1000__iB_0()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1000 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__7____iOffset_0__iA_1000__iB_0()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1000 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__8____iOffset_0__iA_1000__iB_1100()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  1000, 1100 );
  if ( iC != 2100 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__9____iOffset_0__iA_1000__iB_2200()
{
  int iC;
  iOffset = 0;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3200 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__10____iOffset_5__iA_S1001__iB_2200()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  -1001, 2200 );
  if ( iC != 1204 )
  {
    return 0;

  }
  if ( iLastA != -1001 )
  {
    return 0;

  }

return 1;

}


static int unit_test__11____iOffset_5__iA_1001__iB_2200()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  1001, 2200 );
  if ( iC != 3206 )
  {
    return 0;

  }
  if ( iLastA != 1001 )
  {
    return 0;

  }

return 1;

}


static int unit_test__12____iOffset_5__iA_S1000__iB_2200()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  -1000, 2200 );
  if ( iC != 1205 )
  {
    return 0;

  }
  if ( iLastA != -1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__13____iOffset_5__iA_0__iB_2200()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  0, 2200 );
  if ( iC != 2205 )
  {
    return 0;

  }
  if ( iLastA != 0 )
  {
    return 0;

  }

return 1;

}


static int unit_test__14____iOffset_5__iA_1000__iB_2200()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3205 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__15____iOffset_5__iA_1000__iB_0()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1005 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__16____iOffset_5__iA_1000__iB_1100()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  1000, 1100 );
  if ( iC != 2105 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__17____iOffset_5__iA_1000__iB_2200()
{
  int iC;
  iOffset = 5;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3205 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__18____iOffset_10__iA_S1001__iB_2200()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  -1001, 2200 );
  if ( iC != 1209 )
  {
    return 0;

  }
  if ( iLastA != -1001 )
  {
    return 0;

  }

return 1;

}


static int unit_test__19____iOffset_10__iA_1001__iB_2200()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  1001, 2200 );
  if ( iC != 3211 )
  {
    return 0;

  }
  if ( iLastA != 1001 )
  {
    return 0;

  }

return 1;

}


static int unit_test__20____iOffset_10__iA_S1000__iB_2200()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  -1000, 2200 );
  if ( iC != 1210 )
  {
    return 0;

  }
  if ( iLastA != -1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__21____iOffset_10__iA_0__iB_2200()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  0, 2200 );
  if ( iC != 2210 )
  {
    return 0;

  }
  if ( iLastA != 0 )
  {
    return 0;

  }

return 1;

}


static int unit_test__22____iOffset_10__iA_1000__iB_2200()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3210 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__23____iOffset_10__iA_1000__iB_0()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1010 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__24____iOffset_10__iA_1000__iB_1100()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  1000, 1100 );
  if ( iC != 2110 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


static int unit_test__25____iOffset_10__iA_1000__iB_2200()
{
  int iC;
  iOffset = 10;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3210 )
  {
    return 0;

  }
  if ( iLastA != 1000 )
  {
    return 0;

  }

return 1;

}


#include <stdio.h>
int main (void)
{
  int iTestRun = 0;
  int iTestSuccessfull = 0;
  int iTestNotSuccessfull = 0;

  printf("Run unit_test__0____iOffset_S1__iA_S1000__iB_0: ");
  iTestRun++;
  if ( unit_test__0____iOffset_S1__iA_S1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__1____iOffset_11__iA_S1000__iB_0: ");
  iTestRun++;
  if ( unit_test__1____iOffset_11__iA_S1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__2____iOffset_0__iA_S1001__iB_0: ");
  iTestRun++;
  if ( unit_test__2____iOffset_0__iA_S1001__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__3____iOffset_0__iA_1001__iB_0: ");
  iTestRun++;
  if ( unit_test__3____iOffset_0__iA_1001__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__4____iOffset_0__iA_S1000__iB_0: ");
  iTestRun++;
  if ( unit_test__4____iOffset_0__iA_S1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__5____iOffset_0__iA_0__iB_0: ");
  iTestRun++;
  if ( unit_test__5____iOffset_0__iA_0__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__6____iOffset_0__iA_1000__iB_0: ");
  iTestRun++;
  if ( unit_test__6____iOffset_0__iA_1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__7____iOffset_0__iA_1000__iB_0: ");
  iTestRun++;
  if ( unit_test__7____iOffset_0__iA_1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__8____iOffset_0__iA_1000__iB_1100: ");
  iTestRun++;
  if ( unit_test__8____iOffset_0__iA_1000__iB_1100() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__9____iOffset_0__iA_1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__9____iOffset_0__iA_1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__10____iOffset_5__iA_S1001__iB_2200: ");
  iTestRun++;
  if ( unit_test__10____iOffset_5__iA_S1001__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__11____iOffset_5__iA_1001__iB_2200: ");
  iTestRun++;
  if ( unit_test__11____iOffset_5__iA_1001__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__12____iOffset_5__iA_S1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__12____iOffset_5__iA_S1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__13____iOffset_5__iA_0__iB_2200: ");
  iTestRun++;
  if ( unit_test__13____iOffset_5__iA_0__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__14____iOffset_5__iA_1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__14____iOffset_5__iA_1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__15____iOffset_5__iA_1000__iB_0: ");
  iTestRun++;
  if ( unit_test__15____iOffset_5__iA_1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__16____iOffset_5__iA_1000__iB_1100: ");
  iTestRun++;
  if ( unit_test__16____iOffset_5__iA_1000__iB_1100() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__17____iOffset_5__iA_1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__17____iOffset_5__iA_1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__18____iOffset_10__iA_S1001__iB_2200: ");
  iTestRun++;
  if ( unit_test__18____iOffset_10__iA_S1001__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__19____iOffset_10__iA_1001__iB_2200: ");
  iTestRun++;
  if ( unit_test__19____iOffset_10__iA_1001__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__20____iOffset_10__iA_S1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__20____iOffset_10__iA_S1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__21____iOffset_10__iA_0__iB_2200: ");
  iTestRun++;
  if ( unit_test__21____iOffset_10__iA_0__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__22____iOffset_10__iA_1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__22____iOffset_10__iA_1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__23____iOffset_10__iA_1000__iB_0: ");
  iTestRun++;
  if ( unit_test__23____iOffset_10__iA_1000__iB_0() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__24____iOffset_10__iA_1000__iB_1100: ");
  iTestRun++;
  if ( unit_test__24____iOffset_10__iA_1000__iB_1100() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }

  printf("Run unit_test__25____iOffset_10__iA_1000__iB_2200: ");
  iTestRun++;
  if ( unit_test__25____iOffset_10__iA_1000__iB_2200() == 1 )
  {
    printf("Success\n");
    iTestSuccessfull++;
  }
  else
  {
    printf("Failed\n");
    iTestNotSuccessfull++;
  }
  printf("Summary\n");
  printf("=======\n");
  printf("Test run %d\n", iTestRun);
  printf("Test sucessfull %d\n", iTestSuccessfull);
  printf("Test not sucessfull %d\n", iTestNotSuccessfull);
  printf("Result: ");
  if (iTestNotSuccessfull > 0)
  {
    printf("Failure");
    return -1;
  }
  printf("Success");
  return 0;
}
