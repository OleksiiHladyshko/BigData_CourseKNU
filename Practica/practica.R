# ���� ���� ������� � ���-������� https://www.kaggle.com/gpreda/covid-world-vaccination-progress?select=country_vaccinations.csv
# install.packages("dplyr")
library(dplyr)

dataFileName <- "country_vaccinations.csv"
df <- read.csv(dataFileName)

# ����� ����������� �����
head(df, 3)
tail(df, 3)
names(df)
ncol(df)
nrow(df)

# ������������� �� �������� ������� ������ ���������� ���� ������������ �������, 
# ��� ��� �� ������� - �������� ��
df <- df[-c(ncol(df)-1, ncol(df))]

# �������� ������� null ������� ��� ������� �������
as.data.frame(colSums(is.na(df)))

# ��������� ���� ����� � ��������
sapply(df, class)
# ������ ��� ������� date �� ��������
transform(df, date= as.Date(date, format= "%Y-%m-%d"))

# ������������ �� �������� �������
sum(duplicated(df), FALSE)

# �������: ����� 10 ���� �� ������� ������������ �����
df %>% group_by(country) %>% summarise(total_vaccinations = max(total_vaccinations, na.rm = TRUE)) %>% arrange(desc(total_vaccinations)) %>% head(10)
