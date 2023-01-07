class TabsColor {
  final int color;
  final String path;
  final int? id;
  final String label;
  TabsColor({
    required this.label,
    required this.color,
    this.id,
    required this.path,
  });
}

List<TabsColor> tabsColor = [
  TabsColor(color: 0xfffa86be, path: "/projects", id: 3, label: "Projeler"),
  TabsColor(color: 0xffa275e3, path: "/customers", id: 2, label: "Müşteriler"),
  TabsColor(color: 0xff251749, path: "/checks", id: 1, label: "Sayımlar"),
  TabsColor(
    label: "Malzemeler",
    color: 0xffdc5d5a,
    path: "/items",
  ),
];
