USE Downloadscenter;

CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  FirstName VARCHAR(60) NOT NULL,
  LastName VARCHAR(60) NOT NULL,
  EmailAddress VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Downloads (
  DownloadID INT PRIMARY KEY,
  Filename VARCHAR(60) NOT NULL,
  Date DATETIME NOT NULL,
  Time TIME NOT NULL,
  UserID INT,  
  FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(60) NOT NULL,
  DownloadID INT,
  FOREIGN KEY (DownloadID) REFERENCES Downloads(DownloadID)
);


INSERT INTO Users (UserID, FirstName, LastName, EmailAddress) VALUES
(1, 'Santiago', 'Laguado', 'santiagolaguado57@gmail.com'),
(2, 'Luis', 'Laguado', 'luis@gmail.com'),
(3, 'Daniel', 'Navas', 'correodaniel@gmail.com'),
(4, 'Fabian', 'Mantilla', 'correofabian@gmail.com'),
(5, 'Oscar', 'Arismendi', 'correoscar@gmail.com');


INSERT INTO Downloads (DownloadID, Filename, Date, Time, UserID) VALUES
(1, 'Minecraft.exe', '2024-05-02', '13:30:00', 1),
(2, 'SteamInstaller.exe', '2024-05-02', '13:30:00', 4),
(3, 'SpotifyInstaller.exe', '2024-05-02', '13:30:00', 3),
(4, 'InstallVALORANT.exe', '2024-05-02', '13:30:00', 1),
(5, 'cuentes.xml', '2024-05-02', '13:30:00', 5);


