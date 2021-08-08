<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/FerasHamam/LegacyWallpapers">
    <img src="https://github.com/FerasHamam/LegacyWallpapers/blob/master/lib/assets/images/icon.jpg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Legacy</h3>

  <p align="center">
    Legacy is a simple way to discover astonishing wallpapers for your phone!
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
	<li><a href="#Important">Important</a></li>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project



https://user-images.githubusercontent.com/82242700/128649261-e409ff93-265a-4b96-984a-994b1b955859.mp4



### Built With

* [Flutter](https://flutter.dev/)
* [Pixabay](https://pixabay.com/)



<!-- GETTING STARTED -->
## Getting Started

### Important

You can use my application as a reference for design but you cannot use it for commercial use.


### Prerequisites

* [Flutter installed](https://flutter.dev/docs/get-started/install)
* [Pixabay API key](https://pixabay.com/service/about/api/)


### Installation

1. Clone the repo

   ```sh
   git clone https://github.com/FerasHamam/LegacyWallpapers.git
   ```
3. Run the following in your IDE terminal
   ```sh
   flutter pub get
   ```
3. Change Pixabay API key in lib => Providers => Wallpapers.dart file [line 133]
   ```sh
   'https://pixabay.com/api/?key=YourKey&$lookingFor&orientation=vertical&per_page=20&min_width=1019&min_height=1080'
   ```
 


<!-- USAGE EXAMPLES -->
## Usage

<p>Application functionality:</p>
<ul>
  <li>Set wallpapers as Home Screen</li>
  <li>Set wallpapers as Lock Screen</li>
  <li>Set wallpapers to both Home and Lock Screens</li>
  <li>Download wallpapers</li>
  <li>Marking wallpapers as favorite</li>

</ul>



<!-- CONTACT -->
## Contact

[@hamam_feras](https://twitter.com/hamam_feras) - feras.i.hamam@gmail.com

Project Link: [https://github.com/FerasHamam/LegacyWallpapers](https://github.com/FerasHamam/LegacyWallpapers)

Playstore link: [Soon]()
