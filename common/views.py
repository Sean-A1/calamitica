from django.shortcuts import render, redirect
from common.forms import UserForm

import json
from django.http import HttpResponse


def home(request):
    return render(request, "common/home.html")
