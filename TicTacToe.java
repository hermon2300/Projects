import java.util.Scanner;

public class TicTacToe {
    public static void main(String[] args) {
        char[][] board = {{' ', '|', ' ', '|', ' '},
                          {'-', '+', '-', '+', '-'},
                          {' ', '|', ' ', '|', ' '},
                          {'-', '+', '-', '+', '-'},
                          {' ', '|', ' ', '|', ' '}};
        char player1 = 'X';
        char player2 = 'O';

        Scanner scanner = new Scanner(System.in);

        int moveCount = 0;
        boolean gameOver = false;
        while (!gameOver) {
            char player = moveCount % 2 == 0 ? player1 : player2;
            System.out.println("Player " + player + ", enter your move (1-9):");
            int position = -1;
            while (position < 0 || position > 8 || board[position / 3 * 2][position % 3 * 2] != ' ') {
                String input = scanner.nextLine();
                try {
                    position = Integer.parseInt(input) - 1;
                } catch (NumberFormatException e) {
                    System.out.println("Invalid input. Enter a number between 1 and 9:");
                }
                if (position < 0 || position > 8) {
                    System.out.println("Invalid input. Enter a number between 1 and 9:");
                } else if (board[position / 3 * 2][position % 3 * 2] != ' ') {
                    System.out.println("Invalid move. The position is already taken. Enter a different number:");
                }
            }
            board[position / 3 * 2][position % 3 * 2] = player;

            printBoard(board);

            gameOver = isGameOver(board, player);
            moveCount++;

            if (gameOver) {
                System.out.println("Game over! Player " + player + " wins");
            } else if (moveCount == 9) {
                System.out.println("Game over! It's a draw.");
            }
        }
    }

    public static boolean isGameOver(char[][] board, char player) {
        // check for horizontal wins
        for (int i = 0; i < 3; i++) {
            if (board[i * 2][0] == player && board[i * 2][2] == player && board[i * 2][4] == player) {
                return true;
            }
        }
        // check for vertical wins
        for (int j = 0; j < 3; j++) {
            if (board[0][j * 2] == player && board[2][j * 2] == player && board[4][j * 2] == player) {
                return true;
            }
        }
        // check for diagonal wins
        if (board[0][0] == player && board[2][2] == player && board[4][4] == player) {
            return true;
        }
        if (board[0][4] == player && board[2][2] == player && board[4][0] == player) {
            return true;
        }
        return false;
    }
 static void printBoard(char[][] board) {
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[i].length; j++) {
                System.out.print(board[i][j]);
            }
            System.out.println();
        }
    }
}
