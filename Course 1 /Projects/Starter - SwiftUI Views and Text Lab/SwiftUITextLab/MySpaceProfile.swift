//
//  MySpaceProfile.swift
//  SwiftUITextLab
//
//  Created by Jane Madsen on 9/10/25.
//

import SwiftUI

/*
 ## Instructions:
 Your goal is to create an app that will serve as a social media profile. Use Text view modifiers to arrange and style your profile to reflect your unique style.
 
 Since this assignment will require you to choose custom fonts, you may want to open the Font Book app installed on your Mac, where you can view a list of the fonts available on Mac and iOS by default.
 
 If you would like to change the background color of each of these views, you can do so by changing the colors listed in each #Preview macro at the bottom of the page.
 
 1. Create three structs that conform to View: ProfileView, TopFiveFriendsView, and BlogPostView. This will fix the errors
 2. To see a preview of how each view will look in the app, make sure you have opened your canvas (Option + Command + Return). You can view each struct you've created by clicking on the tabs at the top of the canvas.
 3. Create a profile view with Text elements for each of the following items: Username, Real Name, Home City, and Bio. Style each of them appropriately with custom fonts, font sizes, and colors for each. Feel free to add any additional modifiers as well.
 4. Create a TopFiveFriends view with a list of your friends, ranked in order of favorite to least favorite. (Don't worry, we won't tell them). Use a different font and color for each person, and include an Emoji to represent each one as well.
 5. Create a BlogPostView. Write a long blog post. Give your blog post a title, a date posted, a body, and a display of number of likes and comments. Once again, style each individually with fonts, font sizes, and colors, and any other modifiers you would like.
 6. Try running the app. You should see all three views embedded in Tabs (the code for this is in SwiftUITextLabApp.swift). You may need to adjust the style slightly to accommodate the Tab Bar at the bottom of the screen.
 
 ## Black Diamond
 
 7. Add one or more Image views to each page.
 8. Use Stack views to arrange your content more dynamically.
 
 ## Rubric
 
 - App has a profile view with Username, Real Name, Home City, and Bio, appropriately filled out and styled.
 - App has a Top Five Friends screen with emoji, fonts, and colors for each friend.
 - App has a blog post view with a title, a date posted, a body, and a number of likes and comments. All are styled, sized, and colored appropriately.
 */
struct ProfileView: View {
    var body: some View {
        VStack(spacing: 24) {
                Text("Daniel.SwiftUI")
                .font(.custom("Arial Rounded MT Bold", size: 25))
                .padding()
                    .foregroundStyle(.black)
            VStack(alignment: .center){
                HStack() {
                    Image(systemName: "person.circle")
                        .font(.system(size: 75))
                        .foregroundStyle(.gray)
                    Text("Daniel Umpierrez")
                        .frame(width: 270, height: 30, alignment: .topLeading)
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                }
                
                Text("Home City: Provo")
                    .padding()
                    .frame(width: 370, height: 40, alignment: .topLeading)
                    .font(.custom("Arial Rounded MT Bold", size: 15))
                    .foregroundStyle(.black)
                    
                Text("Bio: Driven by purpose, guided by integrity, focused on meaningful results.")
                    .frame(width: 370, height: 100, alignment: .topLeading)
                    .offset(x: 20, y: 20)
                    .background(Color(UIColor.lightGray))
                    .cornerRadius(10)
                    .font(.custom("Arial Rounded MT Bold", size: 15))
                    .foregroundStyle(.black)            }
            Spacer()
        }
    }
}
struct TopFiveFriendsView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Top 5 Friends")
                .font(.custom("Arial Rounded MT Bold", size: 25))
                .foregroundStyle(.black)
            VStack(alignment: .center) {
                HStack (alignment: .center){
                    Text("1st")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                        .padding()
                    Text("Friend 1 ❤️")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                }
                HStack (alignment: .center){
                    Text("2nd")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                        .padding()
                    Text("Friend 2 😂")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                }
                HStack (alignment: .center){
                    Text("3rd")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                        .padding()
                    Text("Friend 3 😜")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                }
                HStack (alignment: .center){
                    Text("4th")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                        .padding()
                    Text("Friend 4 😏")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                }
                HStack (alignment: .center){
                    Text("5th")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                        .padding()
                    Text("Friend 5 😎")
                        .font(.custom("Arial Rounded MT Bold", size: 25))
                        .foregroundStyle(.black)
                }
            }
            .frame(width: 370)
            .background(Color(UIColor.lightGray))
            .cornerRadius(10)
            Spacer()
        }
    }

}
struct BlogPostView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Blog")
                .font(.custom("Arial Rounded MT Bold", size: 25))
                .foregroundStyle(.black)
            VStack (alignment: .leading) {
                Text("Title: Driven by Purpose")
                    .frame(width: 300, height: 40, alignment: .leading)
                    .font(.custom("Arial Rounded MT Bold", size: 25))
                    .foregroundStyle(.black)
                Text("Date: 02/17/2026")
                    .frame(width: 300, height: 40, alignment: .leading)
                    .font(.custom("Arial Rounded MT Bold", size: 15))
                    .foregroundStyle(.black)
                VStack {
                    Text("Body: Progress rarely arrives in dramatic leaps. More often, it shows up through steady focus, thoughtful choices, and the willingness to improve a little each day. Meaningful results grow from that rhythm, clarity, integrity, action, repeat.")
                        .frame(width: 335, height: 265, alignment: .topLeading)
                        .frame(width: 370, height: 300, alignment: .topLeading)
                        .offset(x: 20, y: 20)
                        .fixedSize(horizontal: false, vertical: true)
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .font(.custom("Arial Rounded MT Bold", size: 20))
                        .foregroundStyle(.black)
                }
                HStack {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .font(.system(size: 25))
                        Text("Likes: 25k")
                            .frame(width: 150,height: 150,alignment: .leading)
                            .font(.custom("Arial Rounded MT Bold", size: 20))
                            .foregroundStyle(.black)
                    }
                    HStack {
                        Image(systemName: "ellipsis.bubble.fill")
                            .foregroundStyle(.blue)
                            .font(.system(size: 25))
                        Text("Comments: 67")
                            .font(.custom("Arial Rounded MT Bold", size: 20))
                            .foregroundStyle(.black)
                    }
                }
            }
            Spacer()
        }
        
    }

}
#Preview("ProfileView") {
    ProfileView()
        .background(.white)
}

#Preview("TopFiveFriendsView") {
    TopFiveFriendsView()
        .background(.white)
}

#Preview("BlogPostView") {
    BlogPostView()
        .background(.white)
}
