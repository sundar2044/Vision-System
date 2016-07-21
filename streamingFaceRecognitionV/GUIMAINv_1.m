function varargout = GUIMAINv_1(varargin)
% GUIMAINv_1 MATLAB code for GUIMAINv_1.fig
%      GUIMAINv_1, by itself, creates a new GUIMAINv_1 or raises the existing
%      singleton*.
%
%      H = GUIMAINv_1 returns the handle to a new GUIMAINv_1 or the handle to
%      the existing singleton*.
%
%      GUIMAINv_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMAINv_1.M with the given input arguments.
%
%      GUIMAINv_1('Property','Value',...) creates a new GUIMAINv_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIMAINv_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIMAINv_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIMAINv_1

% Last Modified by GUIDE v2.5 20-Jul-2016 11:43:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIMAINv_1_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIMAINv_1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIMAINv_1 is made visible.
function GUIMAINv_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIMAINv_1 (see VARARGIN)

% Choose default command line output for GUIMAINv_1
handles.output = hObject;
% axes(handles.videoFrame);
% %%
% global vidObj;
% vidObj = webcam(2);
% handles.vidObj=vidObj;
% %vidRes = get(vid, 'VideoResolution');
% vidRes = vidObj.Resolution;
% %nBands = vid.NumberOfBands;
% hImage = image(zeros(str2num(vidRes(5:7)),str2num(vidRes(1:3)),3));
% 
% %img = snapshot(vidObj);
% %%
% preview(vidObj,hImage);
guidata(hObject,handles);
% Update handles structure

% UIWAIT makes GUIMAINv_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIMAINv_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in signIn.
function signIn_Callback(hObject, eventdata, handles)
% hObject    handle to signIn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
streamingFaceRecognition_signIn;
%%% PREPROCESSING OPTIONS:


% --- Executes on button press in signOut.
function signOut_Callback(hObject, eventdata, handles)
% hObject    handle to signOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
streamingFaceRecognition_signOut;

% --- Executes on button press in update.
function update_Callback(hObject, eventdata, handles)
% hObject    handle to update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
streamingFaceRecognition_update;

% --- Executes during object creation, after setting all properties.
function videoFrame_CreateFcn(hObject, eventdata, handles)
% hObject    handle to videoFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate videoFrame


% --- Executes during object creation, after setting all properties.
function msgBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msgBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
