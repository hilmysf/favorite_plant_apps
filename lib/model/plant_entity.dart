class PlantEntity {
  String name;
  String description;
  String price;
  String height;
  String area;
  String temperature;
  String imageAsset;

  PlantEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.height,
    required this.area,
    required this.temperature,
    required this.imageAsset,
  });
}

var plantList = [
  PlantEntity(
      name: 'Rosemary',
      description:
          'Salvia rosmarinus, commonly known as rosemary, is a shrub with fragrant, evergreen, needle-like leaves and white, pink, purple, or blue flowers, native to the Mediterranean region.',
      price: '\$14.00',
      height: '40 cm',
      area: 'In door',
      temperature: '0 C',
      imageAsset: 'images/rosemary.jpg'),
  PlantEntity(
      name: 'Peruvian Cactus',
      description:
          'Cereus peruvianus also known as Peruvian Apple Cactus or Queen of the Night is a bluish green desert cactus that grows upright in a single column with 3-5 blades.',
      price: '\$20.77',
      height: '10 cm',
      area: 'Out door',
      temperature: '25 C',
      imageAsset: 'images/peruvian.png'),
  PlantEntity(
      name: 'Monstera',
      description:
          'Monstera is a genus of 45 species of flowering plants in the arum family, Araceae, native to tropical regions of the Americas. The genus is named from the Latin word for "monstrous" or "abnormal", and refers to the unusual leaves with natural holes that members of the genus have.',
      price: '\$19.04',
      height: '50 cm',
      area: 'In door',
      temperature: '10 C',
      imageAsset: 'images/monstera.jpg'),
  PlantEntity(
      name: 'Snake Plant',
      description:
          'Dracaena trifasciata is a species of flowering plant in the family Asparagaceae, native to tropical West Africa from Nigeria east to the Congo. It is most commonly known as the snake plant, Saint George\'s sword, mother-in-law\'s tongue, and viper\'s bowstring hemp, among other names.',
      price: '\$25.44',
      height: '30 cm',
      area: 'Out door',
      temperature: '25 C',
      imageAsset: 'images/snake-plant.jpg'),
  PlantEntity(
      name: 'Chrobotek reniferowy',
      description:
          'Mushroom species belonging to the moth family. Due to its coexistence with algae, it is classified as a lichen.',
      price: '\$6.50',
      height: '15 cm',
      area: 'In door',
      temperature: '20 C',
      imageAsset: 'images/chrobotek-reniferowy.jpg'),
  PlantEntity(
      name: 'Aglonema',
      description:
      'Aglaonema is a genus of flowering plants in the arum family, Araceae. They are native to tropical and subtropical regions of Asia and New Guinea',
      price: '\$17.49',
      height: '45 cm',
      area: 'Out door',
      temperature: '21 C',
      imageAsset: 'images/aglonema.jpg'),
];
