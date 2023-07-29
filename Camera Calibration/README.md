# Camera Calibration 

[![MATLAB](https://img.shields.io/badge/MATLAB-R2021b%20or%20later-blue.svg)](https://www.mathworks.com/products/matlab.html)

## Introduction
In this assignment, we focused on camera calibration, an important technique in computer vision that allows us to estimate the intrinsic and extrinsic parameters of a camera. The goal was to accurately relate image coordinates to real-world coordinates using a calibration rig and various corner detection methods.

## Calibration Rig Construction
For this assignment, I constructed a precise calibration rig using two identical checkerboard patterns printed on a high-quality laser printer. I placed these checkerboard patterns on orthogonal planes by using two walls in my room. I ensured that I could easily associate a world coordinate system with the calibration rig and calculated the metric (in mm) world coordinates of all corner points on the rig using simple geometry and trigonometry.
![Camera Calibration](Media%20Resources/CalibrationRig.jpg)

## Corner Detection
Next, I captured an image of the calibration rig using an off-the-shelf camera (specifications: `64 MP, f/1.8, 26mm (wide), 1/1.72", 0.8µm, PDAF`). To extract corner points from the image, I experimented with two corner detection methods: Harris corner detection and intersections of Hough lines. After trying both methods, I decided to proceed with Harris corner detection as it provided more accurate results. I made sure to select a sufficient number of corner points (approximately 30-50 points from both planes) to enhance the accuracy of the calibration process.
| ![Detected Harris Corners](Media%20Resources/detectedHarris.jpg) | ![Selected Harris Corners](Media%20Resources/selectedHarris.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Detected Harris Corners                  |                Selected Harris Corners                  |


## Camera Calibration
For camera calibration, I applied the camera projection matrix method covered in our class lectures. This method allowed me to calibrate the camera using the extracted corner points effectively. Additionally, I explored the Camera Calibration Toolbox for Matlab, which provided valuable insights and assisted me in cross-validating the calibration results. The toolbox proved to be a robust and convenient resource during this process.
![Camera Calibration](Media%20Resources/MatlabCalibration.png)

## Results from the Camera Calibration Toolbox in Matlab
| ![Extrinsic Parameter Visualization ](Media%20Resources/Extrinsic_Parameter_Visualization.jpg) | ![Mean Reprojection Error per Image](Media%20Resources/Mean_Reprojection_Error_per_image.jpg) |
|:---------------------------------------:|:---------------------------------------:|
|                Extrinsic Parameter Visualization                 |                Mean Reprojection Error per Image                  |

## Lab Report
For a more detailed report of this work, you can find the PDF [here](Report/Moses%20Chuka%20Ebere%20-%20EE%20417%20-%20Assignment%202.pdf).

## Discussion and Comparison
Upon completing the calibration process, I thoroughly analyzed the results obtained. The calibration rig and Harris corner detection method yielded impressive accuracy in estimating camera parameters. However, intersections of Hough lines were not as consistent in providing reliable corner points for calibration. Comparing the results with the Camera Calibration Toolbox for Matlab, I found a close correlation, which verified the accuracy of our implementation.

## Conclusion
This assignment on camera calibration was an insightful learning experience. I gained a deeper understanding of camera parameters and the significance of precise calibration in computer vision applications. I also had the opportunity to explore different corner detection methods and to use the Camera Calibration Toolbox for Matlab. The knowledge gained from this assignment will undoubtedly be valuable in future computer vision endeavors.
