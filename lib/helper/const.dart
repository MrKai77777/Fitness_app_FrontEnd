import 'dart:ui';

/// Basic
const kPrimaryColor = Color(0xFF30D5C8);
const kRedColor = Color(0xF5FF0101);

const dummyLeaderBoard = [
  {
    "name": "Neerav",
    "score": "100",
  },
  {
    "name": "Monik",
    "score": "90",
  },
  {
    "name": "Saugat",
    "score": "80",
  },
  {
    "name": "Shilasha",
    "score": "79",
  },
  {
    "name": "Ishan",
    "score": "70",
  },
];

/// API
const baseUrl = "https://fitness-app-backend-bhh0.onrender.com";

const getUserData = "/getData";
const login = "/login";
const register = "/signUp";
const editProfile = "/editProfile";
const getDataofUser = '/showUser';
const addGroup = '/task/add';
const addFriends = '/addFriends';
const joinGroup = '/task/joinGroup';
const addGoals = '/addGoals';
const viewUserRecords = '/record/showUser';
const getFriendData = '/friend/showUserFriend';
const createRecord = '/record/enter';
const createFriend = '/friend/enter';
const recordData = '/recordData';
const calorieRecommend = '/calorie';
const calorieReset = '/calorieReset';
const getGroups = '/task/show';

const bearerToken = "token";

const dummyApi = "https://jsonplaceholder.typicode.com/albums/1";



/// fetchAlbum
