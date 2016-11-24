# BackGround

With 79 explanatory variables describing (almost) every aspect of residential homes in Ames, Iowa, this competition challenges you to predict the final price of each home.

# Data

## Data Fields

Id  (1): 编号
MSSubClass  (60): The building class, 建筑级别
MSZoning    (RL): The general zoning classification, 房子所在地域等级
LotFrontage (65): Linear feet of street connected to property, 距离街道距离
LotArea (8450): Lot size in square feet, 占地总面积
Street  (Pave): Type of road access, 通往街道方式
Alley   (NA): Type of alley access, 通往小巷方式
LotShape    (Reg): General shape of property, 房子形状
LandContour (Lvl): Flatness of the property, 房子平坦度
Utilities   (AllPub): Type of utilities available, 周边公共设施供给
LotConfig   (Inside): Lot configuration
LandSlope   (Gtl): Slope of property, 房子倾斜度
Neighborhood    (CollgCr): Physical locations within Ames city limits, 房子所在地址
Condition1  (Norm): Proximity to main road or railroad, 是否接近主干道
Condition2  (Norm): Proximity to main road or railroad (if a second is present)
BldgType    (1Fam): Type of dwelling, 寓所的类型
HouseStyle  (2Story): Style of dwelling, 寓所的风格
OverallQual (7): Overall material and finish quality, 使用材料和完成质量
OverallCond (5): Overall condition rating, 工况等级评价
YearBuilt   (2003): Original construction date, 竣工时间
YearRemodAdd    (2003): Remodel date, 改造时间
RoofStyle   (Gable): Type of roof, 屋顶形状
RoofMatl    (CompShg): Roof material, 屋顶材料
Exterior1st (VinylSd): Exterior covering on house, 房子表面材料
Exterior2nd (VinylSd): Exterior covering on house (if more than one material)
MasVnrType  (BrkFace): Masonry veneer type, 表层砌体的样式
MasVnrArea  (196): Masonry veneer area in square feet, 表层砌体的面积
ExterQual   (Gd): Exterior material quality, 外部材料质量
ExterCond   (TA): Present condition of the material on the exterior, 外部材料目前情况
Foundation  (PConc): Type of foundation, 地基类型
BsmtQual    (Gd): Height of the basement, 地下室高度
BsmtCond    (TA): General condition of the basement, 地下室条件 
BsmtExposure    (No): Walkout or garden level basement walls 
BsmtFinType1    (GLQ): Quality of basement finished area, 地下室已完工地区质量 
BsmtFinSF1  (706): Type 1 finished square feet, 已完工面积
BsmtFinType2    (Unf):  Quality of second finished area (if present) 
BsmtFinSF2  (0): Type 2 finished square feet, 
BsmtUnfSF   (150): Unfinished square feet of basement area, 地下室为完工的面积
TotalBsmtSF (856): Total square feet of basement area, 地下室面积
Heating (GasA):  Type of heating, 加热方式
HeatingQC   (Ex): Heating quality and condition, 加热系统条件和等级
CentralAir  (Y): Central air conditioning, 是否有中心空气系统
Electrical  (SBrkr): Electrical system, 电路系统等级
1stFlrSF    (856): First Floor square feet, 一楼面积
2ndFlrSF    (854): Second floor square feet, 二楼面积
LowQualFinSF    (0): Low quality finished square feet (all floors), 低质量的空间范围
GrLivArea   (1710): Above grade (ground) living area square feet, 地下室以上活动空间面积
BsmtFullBath    (1): Basement full bathrooms, 地下室的full浴室数量
BsmtHalfBath    (0): Basement half bathrooms, 地下室的half浴室数量
FullBath    (2): Full bathrooms above grade, 地下室以上的full浴室数量
HalfBath    (1): Half baths above grade, 地下室以上的half浴室数量
BedroomAbvGr    (3): Number of bedrooms above basement level, 地下室以上的卧室数量
KitchenAbvGr    (1): Number of kitchens, 厨房数量
KitchenQual (Gd): Kitchen quality, 厨房质量
TotRmsAbvGrd    (8): Total rooms above grade (does not include bathrooms), 地面上房间数量
Functional  (Typ): Home functionality rating, 房子功能等级
Fireplaces  (0): Number of fireplaces, 壁炉数量
FireplaceQu (NA): Fireplace quality, 壁炉质量
GarageType  (Attchd): Garage location, 车库所在地
GarageYrBlt (2003): Year garage was built, 车库建成时间
GarageFinish    (RFn): Interior finish of the garage, 
GarageCars  (2): Size of garage in car capacity, 车库停放车数量
GarageArea  (548): Size of garage in square feet, 车库大小
GarageQual  (TA): Garage quality, 车库质量
GarageCond  (TA): Garage condition, 车库条件
PavedDrive  (Y): Paved driveway, 是否有车道
WoodDeckSF  (0): Wood deck area in square feet
OpenPorchSF (61): Open porch area in square feet, Open porch面积
EnclosedPorch   (0): Enclosed porch area in square feet, Enclosed 门廊面积
3SsnPorch   (0): Three season porch area in square feet, Three Season门廊面积
ScreenPorch (0): Screen porch area in square feet, Screen 门廊面积
PoolArea    (0): Pool area in square feet, 水池面积
PoolQC  (NA): Pool quality, 水池质量
Fence   (NA): Fence quality, 围墙质量
MiscFeature (NA): Miscellaneous feature not covered in other categories, 未记录的属性
MiscVal (0): $Value of miscellaneous feature, 未记录属性价位
MoSold  (2): Month Sold, 卖出月份
YrSold  (2008): Year Sold, 卖出时间
SaleType    (WD): Type of sale, 出售类型
SaleCondition   (Normal): Condition of sale, 售卖条件 
SalePrice   (208500):  the property's sale price in dollars, 房价



抽取一些有用的指标
