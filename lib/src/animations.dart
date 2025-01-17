import 'package:flutter/material.dart';

import 'swipe_info.dart';

/// Card Sizes
class CardSizes {
  static Size front(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.9, constraints.maxHeight * 0.9);
  }

  static Size middle(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.85, constraints.maxHeight * 0.85);
  }

  static Size back(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.8, constraints.maxHeight * .9);
  }

  static Size middleRight(BoxConstraints constraints) {
    return Size(constraints.maxWidth * 0.9, constraints.maxHeight * 0.85);
  }

  static Size backRight(BoxConstraints constraints) {
    return Size(constraints.maxWidth * .95, constraints.maxHeight * 0.8);
  }
}

/// Card Alignments
class CardAlignments {
  static Alignment front = Alignment(0.0, -0.5);
  static Alignment frontRight = Alignment(-0.5, 0.0);
  static Alignment middle = Alignment(0.0, 0);
  static Alignment back = Alignment(0.0, 0.5);
  static Alignment backRight = Alignment(0.5, 0);
}

enum StackPosition {
  right,
  bottom,
}

/// Card Forward Animations
class CardAnimations {
  /// 最前面卡片的消失动画
  static Animation<Alignment> frontCardDisappearAnimation(
    AnimationController parent,
    Alignment beginAlignment,
    SwipeInfo info,
  ) {
    return AlignmentTween(
      begin: beginAlignment,
      end: Alignment(
        info.direction == SwipeDirection.Left
            ? beginAlignment.x - 30.0
            : beginAlignment.x + 30.0,
        0.0,
      ),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 中间卡片位置变换动画
  static Animation<Alignment> middleCardAlignmentAnimation(
    AnimationController parent,
    StackPosition stackPosition,
  ) {
    return AlignmentTween(
      begin: CardAlignments.middle,
      end: stackPosition == StackPosition.bottom
          ? CardAlignments.front
          : CardAlignments.frontRight,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 中间卡片尺寸变换动画
  static Animation<Size?> middleCardSizeAnimation(
    AnimationController parent,
    BoxConstraints constraints,
    StackPosition stackPosition,
  ) {
    return SizeTween(
      begin: CardSizes.middle(constraints),
      end: stackPosition == StackPosition.bottom
          ? CardSizes.front(constraints)
          : CardSizes.front(constraints),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 最后面卡片位置变换动画
  static Animation<Alignment> backCardAlignmentAnimation(
    AnimationController parent,
    StackPosition stackPosition,
  ) {
    return AlignmentTween(
      begin: stackPosition == StackPosition.bottom
          ? CardAlignments.back
          : CardAlignments.backRight,
      end: CardAlignments.middle,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );
  }

  /// 最后面卡片尺寸变换动画
  static Animation<Size?> backCardSizeAnimation(
    AnimationController parent,
    BoxConstraints constraints,
    StackPosition stackPosition,
  ) {
    return SizeTween(
      begin: stackPosition == StackPosition.bottom
          ? CardSizes.back(constraints)
          : CardSizes.backRight(constraints),
      end: stackPosition == StackPosition.bottom
          ? CardSizes.middle(constraints)
          : CardSizes.middleRight(constraints),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );
  }
}

/// Card Backward Animations
class CardReverseAnimations {
  /// 最前面卡片的出现动画
  static Animation<Alignment> frontCardShowAnimation(
    AnimationController parent,
    Alignment endAlignment,
    SwipeInfo info,
  ) {
    return AlignmentTween(
      begin: Alignment(
        info.direction == SwipeDirection.Left
            ? endAlignment.x - 30.0
            : endAlignment.x + 30.0,
        0.0,
      ),
      end: endAlignment,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 中间卡片位置变换动画
  static Animation<Alignment> middleCardAlignmentAnimation(
    AnimationController parent,
    StackPosition stackPosition,
  ) {
    return AlignmentTween(
      begin: stackPosition == StackPosition.bottom
          ? CardAlignments.front
          : CardAlignments.frontRight,
      end: CardAlignments.middle,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 中间卡片尺寸变换动画
  static Animation<Size?> middleCardSizeAnimation(
    AnimationController parent,
    BoxConstraints constraints,
  ) {
    return SizeTween(
      begin: CardSizes.front(constraints),
      end: CardSizes.middle(constraints),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// 最后面卡片位置变换动画
  static Animation<Alignment> backCardAlignmentAnimation(
    AnimationController parent,
    StackPosition stackPosition,
  ) {
    return AlignmentTween(
      begin: CardAlignments.middle,
      end: stackPosition == StackPosition.bottom
          ? CardAlignments.back
          : CardAlignments.backRight,
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );
  }

  /// 最后面卡片尺寸变换动画
  static Animation<Size?> backCardSizeAnimation(
    AnimationController parent,
    BoxConstraints constraints,
  ) {
    return SizeTween(
      begin: CardSizes.middle(constraints),
      end: CardSizes.back(constraints),
    ).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );
  }
}
