## Code Book ##

The code book briefly describes the dataset that is created by the executing of the run_analysis.R script.
The script groups the Mean and Standard Deviation variables by the Subject and Activity and calculates the mean value over the grouped values.

## Introduction ##
The variables come from the accelerometer and gyroscope:

1. 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
2. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
3. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
4. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
5. Finally that a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
6. Mean and Standard deviation values are marked by respectively the '-mean()' and '-std()'. 


The executing of the run_analysis.R script groups the Mean and Standard Deviation variables by the Subject and Activity. It then calculates the mean value over the grouped (mean and std) values. Finally exports the data to a file  named SubjectActivMean.txt


**Num | Name: *Description***

1. Subject.No: *The subject (person) who performed the activity (represented by a number).*
2. Activity: *Activity performed by the subject.*
3. tBodyAcc-mean()-X: *Mean estimated from grouped Body acceleration (Time domain) signal on the 'X' axis.*
4. tBodyAcc-mean()-Y: *As tBodyAcc-mean()-X on the 'Y' axis.*
5. tBodyAcc-mean()-Z: *As tBodyAcc-mean()-X on the 'Z' axis.*
6. tGravityAcc-mean()-X:  *Mean estimated from grouped Gravity acceleration (Time domain) signal on the 'X' axis.*
7. tGravityAcc-mean()-Y: *As tGravityAcc-mean()-X on the 'Y' axis.*
8. tGravityAcc-mean()-Z: *As tGravityAcc-mean()-X on the 'Z' axis.*
9. tBodyAccJerk-mean()-X: *Mean estimated from grouped Jerk signals derived (in time domain) from linear acceleration and angular velocity on the 'X' axis.*
10. tBodyAccJerk-mean()-Y: *As tBodyAccJerk-mean()-X on the 'Y' axis.*
11. tBodyAccJerk-mean()-Z: *As tBodyAccJerk-mean()-X on the 'Z' axis.*
12. tBodyGyro-mean()-X: *Mean estimated from grouped Body Gyroscope (Time domain) signal on the 'X' axis.*
13. tBodyGyro-mean()-Y: *As tBodyGyro-mean()-X on the 'Y' axis.*
14. tBodyGyro-mean()-Z: *As tBodyGyro-mean()-X on the 'Z' axis.*
15. tBodyGyroJerk-mean()-X: *Mean estimated from grouped Jerk signals derived (in time domain) from Body gyroscope on the 'X' axis.*
16. tBodyGyroJerk-mean()-Y: *As tBodyGyroJerk-mean()-X on the 'Y' axis.*
17. tBodyGyroJerk-mean()-Z: *As tBodyGyroJerk-mean()-X on the 'Z' axis.*
18. tBodyAccMag-mean(): *Mean estimated from grouped Body Acceleration magnitude of these three-dimensional (time domain) signals.*
19. tGravityAccMag-mean(): *Mean estimated from grouped Gravity Acceleration magnitude of these three-dimensional (time domain) signals.*
20. tBodyAccJerkMag-mean(): *Mean estimated from grouped Body Acceleration Jerk signals magnitude of these three-dimensional (time domain) signals.*
21. tBodyGyroMag-mean(): *Mean estimated from grouped Body Gyrometer magnitude of these three-dimensional (time domain) signals.*
22. tBodyGyroJerkMag-mean(): *Mean estimated from grouped Body Gyrometer Jerk signals magnitude of these three-dimensional (time domain) signals.*
23. fBodyAcc-mean()-X: *As tBodyAcc-mean()-X in frequency domain.*
24. fBodyAcc-mean()-Y: *As tBodyAcc-mean()-Y in frequency domain.*
25. fBodyAcc-mean()-Z: *As tBodyAcc-mean()-Z in frequency domain.*
26. fBodyAccJerk-mean()-X: *As tBodyAccJerk-mean()-X in frequency domain.*
27. fBodyAccJerk-mean()-Y: *As tBodyAccJerk-mean()-Y in frequency domain.*
28. fBodyAccJerk-mean()-Z: *As tBodyAccJerk-mean()-Z in frequency domain.*
29. fBodyGyro-mean()-X: *As tBodyGyro-mean()-X in frequency domain.*
30. fBodyGyro-mean()-Y: *As tBodyGyro-mean()-Y in frequency domain.*
31. fBodyGyro-mean()-Z: *As tBodyGyro-mean()-Z in frequency domain.*
32. fBodyAccMag-mean(): *As tBodyAccMag-mean() in frequency domain.*
33. fBodyBodyAccJerkMag-mean(): *As tBodyAccJerkMag-mean() in frequency domain.*
34. fBodyBodyGyroMag-mean(): *As tBodyGyroMag-mean() in frequency domain.*
35. fBodyBodyGyroJerkMag-mean(): *As tBodyGyroJerkMag-mean() in frequency domain.*
36. tBodyAcc-std()-X: *As tBodyAcc-mean()-X. Mean of grouped Standard Deviation.*
37. tBodyAcc-std()-Y: *As tBodyAcc-mean()-Y. Mean of grouped Standard Deviation.*
38. tBodyAcc-std()-Z: *As tBodyAcc-mean()-Z. Mean of grouped Standard Deviation.*
39. tGravityAcc-std()-X: *As tGravityAcc-mean()-X. Mean of grouped Standard Deviation.*
40. tGravityAcc-std()-Y: *As tGravityAcc-mean()-Y. Mean of grouped Standard Deviation.*
41. tGravityAcc-std()-Z: *As tGravityAcc-mean()-Z. Mean of grouped Standard Deviation.*
42. tBodyAccJerk-std()-X: *As tBodyAccJerk-mean()-X. Mean of grouped Standard Deviation.*
43. tBodyAccJerk-std()-Y: *As tBodyAccJerk-mean()-Y. Mean of grouped Standard Deviation.*
44. tBodyAccJerk-std()-Z: *As tBodyAccJerk-mean()-Z. Mean of grouped Standard Deviation.*
45. tBodyGyro-std()-X: *As tBodyGyro-mean()-X. Mean of grouped Standard Deviation.*
46. tBodyGyro-std()-Y: *As tBodyGyro-mean()-Y. Mean of grouped Standard Deviation.*
47. tBodyGyro-std()-Z: *As tBodyGyro-mean()-Z. Mean of grouped Standard Deviation.*
48. tBodyGyroJerk-std()-X: *As tBodyGyroJerk-mean()-X. Mean of grouped Standard Deviation.*
49. tBodyGyroJerk-std()-Y: *As tBodyGyroJerk-mean()-Y. Mean of grouped Standard Deviation.*
50. tBodyGyroJerk-std()-Z: *As tBodyGyroJerk-mean()-Z. Mean of grouped Standard Deviation.*
51. tBodyAccMag-std(): *As tBodyAccMag-mean(). Mean of grouped Standard Deviation.*
52. tGravityAccMag-std(): *As tGravityAcc-mean(). Mean of grouped Standard Deviation.*
53. tBodyAccJerkMag-std(): *As tBodyAccJerkMag-mean(). Mean of grouped Standard Deviation.*
54. tBodyGyroMag-std(): *As tBodyGyroMag-mean(). Mean of grouped Standard Deviation.*
55. tBodyGyroJerkMag-std(): *As tBodyGyroJerkMag-mean(). Mean of grouped Standard Deviation.*
56. fBodyAcc-std()-X: *As tBodyAcc-std()-X in frequency domain.*
57. fBodyAcc-std()-Y: *As tBodyAcc-std()-Y in frequency domain.*
58. fBodyAcc-std()-Z: *As tBodyAcc-std()-Z in frequency domain.*
59. fBodyAccJerk-std()-X: *As tBodyAccJerk-std()-X in frequency domain.*
60. fBodyAccJerk-std()-Y: *As tBodyAccJerk-std()-Y in frequency domain.*
61. fBodyAccJerk-std()-Z: *As tBodyAccJerk-std()-Z in frequency domain.*
62. fBodyGyro-std()-X: *As tBodyGyro-std()-X in frequency domain.*
63. fBodyGyro-std()-Y: *As tBodyGyro-std()-Y in frequency domain.*
64. fBodyGyro-std()-Z: *As tBodyGyro-std()-Z in frequency domain.*
65. fBodyAccMag-std(): *As tBodyAccMag-std() in frequency domain.*
66. fBodyBodyAccJerkMag-std(): *As tBodyBodyAccJerkMag-std() in frequency domain.*
67. fBodyBodyGyroMag-std(): *As tBodyBodyGyroMag-std() in frequency domain.*
68. fBodyBodyGyroJerkMag-std(): *As tBodyBodyGyroJerkMag-std() in frequency domain.*
