# MVVMDesignPattern-UIKit
![Screenshot 2023-08-05 at 09 47 19](https://github.com/dodiforth/MVVMDesignPattern-UIKit/assets/50798761/d5ba4101-b7d7-4540-be43-b7832f30a92d)
Let’s get start right in.

What is  the MVVM pattern ?

> MVVM stands for Model View View Model. It describes the flow of our data and the separation of our concerns. The following imagery can represent it. by Vinícius Salmont
>
![swiftmvvm](https://github.com/dodiforth/MVVMDesignPattern-UIKit/assets/50798761/41b35ed3-f52e-490a-b54d-9d4ba5986c1b)
https://adevait.com/ios/swift-tutorial-mvvm-design-pattern

So the first letter M

- M: Stands for Model. Just like in the MVC it represents the data from the datasource which can be from remote URL or local e.g. For example, having a user object and the model describes various attributes of the user like FirstName, LastName, and Email. Also certain actions that user can perform for example, it could have methods: saveUser, updateUser, deleteUserEmail, etc.
    
    → A model should just be kept as simple as to reflect directly what data structure of the datasource is.
    
- V: Stands for View. It’s just basically whatever user can see on a screen of the device like buttons, text fields, and switch controls, etc.
- VM: Finally the letters unlike the MVC ! VM stands for View Model. Just like the name implies, it means a model for a specific view. So comparing with the MVC, MVC tends to have a user object with all of the user attributes. And all views that are available for the app has access to all of the user objects.
    
    But for a ViewModel of the MVVM, every view has its own ViewModel.
    
    ---
    

Before to get into the example Project, let me explain the actions in the MVVM Pattern.
![Screenshot 2023-08-05 at 10 51 14](https://github.com/dodiforth/MVVMDesignPattern-UIKit/assets/50798761/f5daf22f-50cd-421d-a221-d74323a34282)
https://www.youtube.com/watch?v=sLHVxnRS75w&t=57s

If user performs an action, the ViewModel is going to be aware of it. The ViewModel contains our business logic. So now that the ViewModel is aware, it’s going to perform whatever sort of logic is required for that particular data. Let’s say the user want to login. So ViewModel takes in action to  get some data from the storage (local/server). And when it’s done, it(ViewModel) updates the View.

But, unlike the MVC pattern, the updates isn’t done directly, it’s done by using Binder, if you will.

What this means is that the ViewModel isn’t aware of the View.

<aside>
💡 The MVC’s controllers tends to act directly with the views. Which means whatever or whenever changes(updates) are made, the controllers modifies the View directly. ← So the controllers are aware of what is available for the various objects, attributes in the View.

</aside>

The ViewModel performs whatever operations needed to do. And when it’s done, it updates a value in the ViewModel.

AND when this value is updated it sends sort of a notification(or broadcast) about this particular object has been changed.

When the notification is sent out, all the views are connected or bound to that object, will be notified. The moment when they’re notified, then they can update their view.

Simply say, the ViewModel should contain some business logic for preparing the data from the Model in the forms required by the View; so there’s no tight coupling between the View and the Model. A ViewModel should also update a Model when needed.

---
