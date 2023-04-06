
mixin StringMixins {
  String formatDate(DateTime date) =>
      "${date.day.toString()}/${date.month.toString()}/${date.year.toString()}";
}