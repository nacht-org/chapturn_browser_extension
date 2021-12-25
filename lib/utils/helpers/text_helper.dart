String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }

  return text.substring(0, 1).toUpperCase() + text.substring(1);
}
