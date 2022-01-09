#!/usr/bin/env python
# coding: utf-8

# # 1) REVERSING A LIST

# In[1]:


# i) Method 1 : Using List indexing
lst = [23,45,32,67,89,54,76,43]
print(lst[::-1])


# In[7]:


# ii) Method 2 : Using Reverse() function
lst2 = ["cat", "dog", "turtle", "croc", "python"]
lst2.reverse()
print(lst2)


# In[16]:


# iii) Method 3 : Using for loops
lst3 = [96, 34,40,56, 67, 48, 59, 84]
for i in range (len(lst3)):
    last_item = lst3.pop()
    lst3.insert(i,last_item)

print(lst3)


# # 2) Maximum Between 2 Numbers

# In[18]:


a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
def Max(a, b):
    if a >= b:
        return a
    else:
        return b
print(Max(a,b))    


# # 3) Removing 'd' from a string

# In[24]:


# Method 1 : Using replace() function
myStr = "I love a dog, dog loves mde"
print(myStr.replace("d", ""))        


# In[43]:


myStr3 = "I love a dog, dog loves mde"
result = ""
for i in myStr3:
    if i == "d":
        pass
    else:
        result += i
print("The initial String is: "myStr)
print("Final String is: "result)

