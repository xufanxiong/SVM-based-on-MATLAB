clear;

%load 'voice' dataset
load('train.mat');
load('test.mat');

%Import X, y
train_X = train(:, 1:20);
train_y = train(:, 21);
test_X = test(:, 1:20);
test_y = test(:, 21);

%get the acc and figure
    
%type - hard margin with dual is 1, soft margin with dual is 2
%type_k - liner kernel is 1, poly kernel is 2, gauss kernel is 3
%Z - tunning parameter
%powern - number of power in poly kernel
type = 2;
type_k = 2;
Z = 10;
powern = 3;

finalnd(train_X, train_y, test_X, test_y, type, type_k, Z, powern)

