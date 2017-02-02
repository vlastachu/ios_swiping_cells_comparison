//
//  BaseTableView.swift
//  SwipeCells
//
//  Created by Vlad on 01/02/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: UITableViewController {
    
    
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = UIColor.black
        edgesForExtendedLayout = []
        automaticallyAdjustsScrollViewInsets = true
        extendedLayoutIncludesOpaqueBars = false
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell(style: .default, reuseIdentifier: cellReuseIdentifier)
        cell.textView.text = data[indexPath.section][indexPath.row]
        cell.selectionStyle = .none
        cell.textView.showHideCallback = { [unowned self] _ in
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        return cell
    }
    
    
    var titles = ["Prologue", "IS HE RIGHT?", "CHAPTER 1", "CHAPTER 3"]
    var data = [["SOLVING THE FOLLOWING riddle will reveal the awful secret behind the universe, assuming you do not go utterly mad in the attempt. If you already happen to know the awful secret behind the universe, feel free to skip ahead.",
                 "Let’s say you have an ax. Just a cheap one, from Home Depot. On one bitter winter day, you use said ax to behead a man. Don’t worry, the man was already dead. Or maybe you should worry, because you’re the one who shot him.",
                 "The repaired ax sits undisturbed in your garage until the spring when, on one rainy morning, you find in your kitchen a creature that appears to be a foot-long slug with a bulging egg sac on its tail. Its jaws bite one of your forks in half with what seems like very little effort. You grab your trusty ax and chop the thing into several pieces. On the last blow, however, the ax strikes a metal leg of the overturned kitchen table and chips out a notch right in the middle of the blade."],
                ["I WAS PONDERING that riddle as I reclined on my porch at 3:00 A.M., a chilled breeze numbing my cheeks and earlobes and flicking tickly hairs across my forehead. I had my feet up on the railing, leaning back in one of those cheap plastic lawn chairs, the kind that blow out onto the lawn during every thunderstorm. It would have been a good occasion to smoke a pipe had I owned one and had I been forty years older. It was one of those rare moments of mental peace I get these days, the kind you don’t appreciate until they’re ov—",
                 "The world was silent again, save for the faint applause of trees rustling in the wind and crumbly dead leaves scraping lightly down the pavement. That, and the scuffle of a mentally challenged dog trying to climb onto the chair next to me. After two attempts to mount the thing, Molly managed to send the chair clattering onto its side. She stared at the toppled chair for several seconds and then started barking at it.",
                 "“Hello?”\n\n“Dave? This is John. Your pimp says bring the he**in shipment tonight, or he’ll be forced to stick you. Meet him where we buried the Korean whore. The one without the goatee.”\n\nThat was code. It meant “Come to my place as soon as you can, it’s important.” Code, you know, in case the phone was bugged.\n\n“John, it’s three in the—”",
                 "Actually, the phone probably was bugged, but I was confident the people doing it could just as easily do some kind of remote intercept of our brain waves if they wanted, so it was moot. Two minutes and one very long sigh later, I was humming through the night in my truck, waiting for the heater to blow warm air and trying not to think of Frank Campo. I clicked on the radio, hoping to keep the fear at bay via distraction. I got a local right-wing talk radio program.",
                 "“I’m here to tell ya, immigration, it’s like rats on a ship. America is the ship and allllll these rats are comin’ on board, y’all. And you know what happens when a ship gets too many rats on board? It sinks. That’s what.”"],
                ["The Levitating “Jamaican”",
                 "THEY SAY LOS Angeles is like The Wizard of Oz. One minute it’s small-town monochrome neighborhoods and then boom—all of a sudden you’re in a sprawling Technicolor freak show, dense with midgets.",
                 "Unfortunately, this story does not take place in Los Angeles.",
                 "The place I was sitting was a small city in the Midwest which will remain undisclosed for reasons that will become obvious later. I was at a restaurant called “They China Food!” which was owned by a couple of brothers from the Czech Republic who, as far as I could tell, didn’t know a whole lot about China or food. I had picked the place thinking it was still the Mexican bar and grill it had been the previous month; in fact, the change was so recent that one wall was still covered by an incompetent mural of a dusky woman riding a bull and proudly flying the flag of Mexico, carrying a cartoon burrito the size of a pig under her arm.",
                 "This is a small city, large enough to have four McDonald’s but not so big that you see more than the occasional homeless person on the way. You can get a taxi here but they’re not out roving around where you can jump off the sidewalk and hail one. You have to call them on the phone, and they’re not yellow.",
                 "The weather varies explosively from day to day in this part of America, the jet stream undulating over us like an angry snake god. I’ve seen a day when the temperature hit one hundred and eight degrees, another when it dipped eighteen degrees below zero, another day when the temperature swung forty-three degrees in eight hours. We’re also in Tornado Alley, so every spring swirling, howling charcoal demons materialize out of the air and shred mobile homes as if they were dropped in huge blenders.",
                 "But all that aside, it’s not a bad town. Not really."],
                [
                    "Grilling with Morgan Freeman",
                    "I WAS ALONE in the “interview” room at the police station; the one-way mirror was to my left. In it I saw myself slumped in the chair, the disorganized black hair, the beard stubble that had crept onto my pale face like mildew on white porcelain.",
                    "Man, you need to lose some weight.",
                    "I had been in there for thirty minutes. Or two hours, or half a day. If you think time stops in the waiting room at the dentist, you ain’t never been alone in an interrogation room at a police station. This is what they do, they throw you in here to stew in the silence, all your guilt and doubts burning a hole in your gut so the truth can spill out onto the tile floor.",
                    "I should have gotten John to a hospital. Hell, I should have called an ambulance as soon as I got off the phone with him this morning. Instead I’ve f**ked around for twelve hours and for all I know that black shit from the syringe was eating through his brain that whole time.",
                    "That ability to see the right choice, but not until several hours have passed since making the wrong one? That’s what makes a person a dumbass, folks.",
                    "Morgan Freeman stepped in and laid a manila folder before me. Thick paper. Photos. A white cop followed him. Something about their manner pissed me off; like they were swooping in on prey. I wasn’t the bad guy here. I wasn’t the one selling that black shit. But now I get to listen to these douchebags tell me everything I should have done instead of what I did? There was no f**king time for that.",
                    "“I want to thank you for coming down, Mr. Wong,” he said. “I bet it’s been quite a night for you. Been a long night for me, too, as a matter of fact.”",
                    "“Okay.” You know what helps? A warm glass of go f**k yourself. “Where’s John?”",
                    "“He’s fine. He’s talking to another officer just a few rooms from here.”",
                    "I actually couldn’t name the actor the black guy reminded me of, so I stuck with Morgan Freeman. Though now that I looked at him he bore almost no resemblance. This man was heavier, with round cheeks, a goatee and a shaved head. I couldn’t remember what he said his name was. His white partner had a crew cut with a mustache. Almost a G. Gordon Liddy, a cookie-cutter cop from central casting. I couldn’t help but think how much cooler he would look if he would just shave his head like his partner. Morgan should say something to him about that.",
                    "“John is talking?” I asked. “Really?”",
                    "“Don’t worry, man. Since you’re both gonna tell the unvarnished truth, you don’t gotta worry about your stories matching, do you? We’re all friendly here. I ain’t here to make you piss in a cup, or to lean on you about all that mess that happened your last year in school with that Hitchcock kid.”",
                    "“Hey, I had nothing to do with—”",
                    "“No, no. Don’t even bother. That’s what I’m sayin’, I’m not here to accuse you of nothin’ at all. Just tell me what you did last night.”","I had a knee-jerk impulse to lie, but realized at the last second that I hadn’t actually done anything illegal. Not as far as I knew. Sounding guilty anyway, I said, “Went to a party out by the lake. I came home just after midnight. I was asleep by two.”",
                    "“You sure about that? You sure you didn’t go over to the One Ball Inn down on Grand Avenue for a nightcap?”",
                    "“What’s a nightcap?”",
                    "“Your buddies were all there.”",
                    "Well, officer, I really only have the one friend . . .",
                    "“No, I had work this morning. As you know. I went straight home.”"]]

}
