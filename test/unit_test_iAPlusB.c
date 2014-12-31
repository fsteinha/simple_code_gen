#include "AplusB.c"


static int unit_test__m_iOffset_S1__iA_S1000__iB_0()
{
  int iC;
  m_iOffset = -1;
  iC = iAPlusB(  -1000, 0 );
  if ( iC != -1001 )
  {
    return 0;
  }
  if ( m_iLastA != -1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_11__iA_S1000__iB_0()
{
  int iC;
  m_iOffset = 11;
  iC = iAPlusB(  -1000, 0 );
  if ( iC != -989 )
  {
    return 0;
  }
  if ( m_iLastA != -1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_S1001__iB_0()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  -1001, 0 );
  if ( iC != -1001 )
  {
    return 0;
  }
  if ( m_iLastA != -1001 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_1001__iB_0()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  1001, 0 );
  if ( iC != 1001 )
  {
    return 0;
  }
  if ( m_iLastA != 1001 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_S1000__iB_0()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  -1000, 0 );
  if ( iC != -1000 )
  {
    return 0;
  }
  if ( m_iLastA != -1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_0__iB_0()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  0, 0 );
  if ( iC != 0 )
  {
    return 0;
  }
  if ( m_iLastA != 0 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_1000__iB_0()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1000 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_1000__iB_0()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1000 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_1000__iB_1100()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  1000, 1100 );
  if ( iC != 2100 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_0__iA_1000__iB_2200()
{
  int iC;
  m_iOffset = 0;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3200 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_S1001__iB_2200()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  -1001, 2200 );
  if ( iC != 1204 )
  {
    return 0;
  }
  if ( m_iLastA != -1001 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_1001__iB_2200()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  1001, 2200 );
  if ( iC != 3206 )
  {
    return 0;
  }
  if ( m_iLastA != 1001 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_S1000__iB_2200()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  -1000, 2200 );
  if ( iC != 1205 )
  {
    return 0;
  }
  if ( m_iLastA != -1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_0__iB_2200()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  0, 2200 );
  if ( iC != 2205 )
  {
    return 0;
  }
  if ( m_iLastA != 0 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_1000__iB_2200()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3205 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_1000__iB_0()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1005 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_1000__iB_1100()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  1000, 1100 );
  if ( iC != 2105 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_5__iA_1000__iB_2200()
{
  int iC;
  m_iOffset = 5;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3205 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_S1001__iB_2200()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  -1001, 2200 );
  if ( iC != 1209 )
  {
    return 0;
  }
  if ( m_iLastA != -1001 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_1001__iB_2200()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  1001, 2200 );
  if ( iC != 3211 )
  {
    return 0;
  }
  if ( m_iLastA != 1001 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_S1000__iB_2200()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  -1000, 2200 );
  if ( iC != 1210 )
  {
    return 0;
  }
  if ( m_iLastA != -1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_0__iB_2200()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  0, 2200 );
  if ( iC != 2210 )
  {
    return 0;
  }
  if ( m_iLastA != 0 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_1000__iB_2200()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3210 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_1000__iB_0()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  1000, 0 );
  if ( iC != 1010 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_1000__iB_1100()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  1000, 1100 );
  if ( iC != 2110 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


static int unit_test__m_iOffset_10__iA_1000__iB_2200()
{
  int iC;
  m_iOffset = 10;
  iC = iAPlusB(  1000, 2200 );
  if ( iC != 3210 )
  {
    return 0;
  }
  if ( m_iLastA != 1000 )
  {
    return 0;
  }

}


