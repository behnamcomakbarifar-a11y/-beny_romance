enum BehaviorState {
  calm,
  defensive,
  lockdown,
}

class AdaptiveBehavior {
  BehaviorState decide({
    required String mood,
    required bool suspicious,
  }) {
    if (suspicious) {
      return BehaviorState.lockdown;
    }

    switch (mood.toLowerCase()) {
      case 'angry':
      case 'sad':
        return BehaviorState.defensive;
      default:
        return BehaviorState.calm;
    }
  }
}
