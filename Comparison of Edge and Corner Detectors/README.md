# Comparison of Edge and Corner Detectors - Computational Assignment

## Introduction

This directory showcases my work on the computational assignment titled "Comparison of Edge and Corner Detectors." During this assignment, I explored various edge and corner detection methods in the Matlab environment and compared their performances. The objective was to analyze different detectors and understand their strengths and limitations when applied to real-world images.

## Edge Detectors

For edge detection, I experimented with three 1st Derivative Edge Detectors: Prewitt, Roberts, and Canny, along with the 2nd Derivative Edge Detector, Laplacian of Gaussian (LoG). I utilized Matlab's edge function implemented in the Image Processing Toolbox to perform edge detection.

| ![Reference Image](Media%20Resources/building.jpg) | ![Edge Images](Media%20Resources/Building_Edge_Subplot.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Reference Image                  |                Edge Images                  |
| ![Reference Image](Media%20Resources/beach.jpg) | ![Edge Images](Media%20Resources/Beach_Edge_Subplot.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Reference Image                  |                Edge Images                  |
| ![Reference Image](Media%20Resources/steps.jpg) | ![Edge Images](Media%20Resources/Steps_Edge_Subplot.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Reference Image                  |                Edge Images                  |

## Corner Detectors

For corner detection, I explored two algorithms: the Minimum Eigenvalue (Kanade-Tomasi) algorithm and the Harris algorithm. I used Matlab's corner function in conjunction with detectHarrisFeatures and detectMinEigenFeatures functions from the Computer Vision Toolbox for corner detection.
| <img src="Media%20Resources/library.jpg" alt="Reference Image" width="500"> | ![Corner Images](Media%20Resources/Library_Corner_Subplot.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Reference Image                  |                Corner Images                  |
| ![Reference Image](Media%20Resources/lego1.jfif) | ![Corner Images](Media%20Resources/Lego_Corner_Subplot.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Reference Image                  |                Corner Images                  |
| <img src="Media%20Resources/bridge.jpg" alt="Reference Image" width="500"> | ![Corner Images](Media%20Resources/Bridge_Corner_Subplot.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Reference Image                  |                Corner Images                  |

## Assignment Tasks

For both edge detectors and corner detectors, I completed the following tasks:

1. **Image Preparation:** I curated a diverse selection of images from the internet to evaluate the detectors' performance on various types of images.

2. **Matlab Scripting:** In true programming fashion, I elegantly scripted a user-friendly Matlab code to efficiently load images into the Matlab workspace. This streamlined the application of edge and corner detectors.

3. **Detector Evaluation:** I called the edge/corner functions with various detectors, including 'prewitt', 'roberts', 'canny', 'log' for edge detection, and 'Harris' and 'MinimumEigenvalue' for corner detection.

4. **Visualization and Analysis:** I visually compared the original images and detection results, gaining insights into each detector's performance.

5. **Performance Comparison:** I conducted a thorough analysis, comparing the detectors' performances on diverse images and considering factors like accuracy, robustness, and computational efficiency.

6. **Discussion of Results:** Based on the comparisons and observations, I provided a detailed discussion of the findings, identifying scenarios where specific detectors excelled and areas where improvements could be made.

## Lab Report
For a more detailed report of this work, you can find the PDF [here](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Assignment%201.pdf).

## Conclusion

This repository presents my exploration of edge and corner detection techniques in computer vision. The assignment allowed me to gain valuable experience in applying various detectors and assessing their effectiveness on real-world images. 
