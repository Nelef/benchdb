DROP DATABASE IF EXISTS benchdb;
CREATE DATABASE benchdb;
USE benchdb;

CREATE TABLE cpu (
  id int(11) NOT NULL AUTO_INCREMENT,
  model varchar(50) DEFAULT NULL,
  gen varchar(50) DEFAULT NULL,
  single_bench int(11),
  multi_bench int(11),
  image varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE gpu (
  id int(11) NOT NULL AUTO_INCREMENT,
  model varchar(50) DEFAULT NULL,
  gen varchar(50) DEFAULT NULL,
  bench int(11),
  image varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE apu (
  id int(11) NOT NULL AUTO_INCREMENT,
  model varchar(50) DEFAULT NULL,
  gen varchar(100) DEFAULT NULL,
  single_bench int(11),
  multi_bench int(11),
  image varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

# Geekbench 5 Benchmarks 참조
# ARM
# (id, model, gen, single_bench, multi_bench, image)
insert into apu values 
  (NULL, 'M1', 'Apple Firestorm', 1705, 7386, 'apple_m_series.webp'),
  (NULL, 'A14 Bionic', 'Apple Firestorm', 1585, 4192, 'apple_a_series.webp'),
  (NULL, 'A13 Bionic', 'Apple Lightning', 1328, 3317, 'apple_a_series.webp'),
  (NULL, 'Snapdragon 865', 'ARM Cortex-A77 + ARM Cortex-A55', 887, 3213, 'qualcomm_snapdragon.webp'),
  (NULL, 'Snapdragon 855', 'Kryo 485 Gold MP1 + Kryo 485 Gold MP3 + Kryo 485 Silver MP4', 710, 2580, 'qualcomm_snapdragon.webp'),
  (NULL, 'Exynos 990', 'Samsung Exynos M5 + ARM Cortex-A76', 808, 2689, 'samsung_exynos.webp'),
  (NULL, 'Exynos 9820', 'Samsung Exynos M4 MP2 + ARM Cortex-A75 MP2 + ARM Cortex-A55 MP4', 760, 2142, 'samsung_exynos.webp');

# Geekbench 5 Benchmarks 참조
# x86
# (id, model, gen, single_bench, multi_bench, image)
insert into cpu values 
  (NULL, 'Ryzen 5 3600', 'AMD zen2', 1202, 6692, 'amd_ryzen.webp'),
  (NULL, 'Ryzen 5 3500X', 'AMD zen2', 1163, 5129, 'amd_ryzen.webp');

# 3DMark Graphics Score 참조
# (id, model, gen, bench, image)
insert into gpu values 
  (NULL, 'GeForce RTX 3080', 'NVIDIA Ampere', 17685, 'Nvidia-RTX-3080.jpg'),
  (NULL, 'GeForce RTX 2080 Ti', 'NVIDIA Turing', 14742, 'Nvidia-RTX-2080-Ti.jpg');
