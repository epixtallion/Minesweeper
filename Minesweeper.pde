import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined
public static final int NUM_COLS = 20;
public static final int NUM_ROWS = 20;
public static final int MAX_BOMBS = 15;

void setup ()
{
    size(500, 500);
    textAlign(CENTER,CENTER);
    background(255);

    // make the manager
    Interactive.make( this );

    //your code to declare and initialize buttons goes here
    buttons = new MSButton[20][20];
    for (int y = 0; y < 20; y++)
      for (int x = 0; x < 20; x++)
        buttons[y][x] = new MSButton(x, y);

    for (int i = 0; i < MAX_BOMBS; i++) setBombs();
}
public void setBombs()
{
  int x = (int) (Math.random()*20);
  int y = (int) (Math.random()*20);
  if (!(bombs.contains(buttons[x][y]))) bombs.add(buttons[x][y]);
  else setBombs();
}

public void draw ()
{
    background(128);
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;

    public MSButton ( int rr, int cc )
    {
        width = 500/NUM_COLS;
        height = 500/NUM_ROWS;
        r = rr;
        c = cc;
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager

    public void mousePressed ()
    {
        clicked = true;
        //your code here
    }

    public void draw ()
    {
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) )
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        //your code here
        return numBombs;
    }
}
