import 'package:chess_game_flutter/soldiers/Bishop.dart';
import 'package:chess_game_flutter/soldiers/I_slodier.dart';
import 'package:chess_game_flutter/soldiers/King.dart';
import 'package:chess_game_flutter/soldiers/Knight.dart';
import 'package:chess_game_flutter/soldiers/Pawn.dart';
import 'package:chess_game_flutter/soldiers/Queen.dart';
import 'package:chess_game_flutter/soldiers/Rook.dart';

class Army {
  late String color;
  late List<ISoldier> pawns;
  late List<ISoldier> bishops;
  late List<ISoldier> knights;
  late List<ISoldier> rooks;
  late ISoldier queen;
  late ISoldier king;
  List<ISoldier> allSoldiers = [];
  ISoldier? currentSelection;

  Army(this.color) {
    // pawns: عسكري - bishops فيل - knights حصان - rooks: طابية - queen: الوزير - king: الملك
    if (color == "b") {
      pawns = [
        Pawn(position: 8, color: color, id: 8),
        Pawn(position: 9, color: color, id: 9),
        Pawn(position: 10, color: color, id: 10),
        Pawn(position: 11, color: color, id: 11),
        Pawn(position: 12, color: color, id: 12),
        Pawn(position: 13, color: color, id: 13),
        Pawn(position: 14, color: color, id: 14),
        Pawn(position: 15, color: color, id: 15)
      ];
      bishops = [
        Bishop(position: 2, color: color, id: 2),
        Bishop(position: 5, color: color, id: 5)
      ];
      knights = [
        Knight(position: 1, color: color, id: 1),
        Knight(position: 6, color: color, id: 6)
      ];
      rooks = [
        Rook(position: 0, color: color, id: 0),
        Rook(position: 7, color: color, id: 7)
      ];
      queen = Queen(position: 3, color: color, id: 3);
      king = King(position: 4, color: color, id: 4);
    }
    if (color == "w") {
      pawns = [
        Pawn(position: 48, color: color, id: 45),
        Pawn(position: 49, color: color, id: 49),
        Pawn(position: 50, color: color, id: 50),
        Pawn(position: 51, color: color, id: 51),
        Pawn(position: 52, color: color, id: 52),
        Pawn(position: 53, color: color, id: 53),
        Pawn(position: 54, color: color, id: 54),
        Pawn(position: 55, color: color, id: 55)
      ];
      bishops = [
        Bishop(position: 58, color: color, id: 58),
        Bishop(position: 61, color: color, id: 61)
      ];
      knights = [
        Knight(position: 57, color: color, id: 57),
        Knight(position: 62, color: color, id: 62)
      ];
      rooks = [
        Rook(position: 56, color: color, id: 56),
        Rook(position: 63, color: color, id: 63)
      ];
      queen = Queen(position: 59, color: color, id: 59);
      king = King(position: 60, color: color, id: 60);
    }
    allSoldiers.addAll(pawns);
    allSoldiers.addAll(knights);
    allSoldiers.addAll(bishops);
    allSoldiers.addAll(knights);
    allSoldiers.addAll(rooks);
    allSoldiers.add(queen);
    allSoldiers.add(king);
  }
}
