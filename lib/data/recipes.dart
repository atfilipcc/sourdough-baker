import '../models/recipe_item_model.dart';

class Recipes {
  List<RecipeItemModel> getRecipe(recipeName) => _recipes[recipeName];

  Map _recipes = {
    'The Night Bake': [
      RecipeItemModel(
        title: 'Feed Starter - 3:00 pm',
        text:
            'Discard most of your starter until you are left with around 20 grams, then refeed your starter with flour and cold water',
        isDone: false,
        durationUntilNext: Duration(
          hours: 4,
          minutes: 0,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
          title: 'Autolyse - 7:00 pm',
          text:
              'Mix the flour and water together without kneading until the entire dough is wet.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 1,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Salt & Starter - 8:00 pm',
          text:
              'The starter should now be fully activated. Mix the starter with the dough and salt and cover.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Stretch & Fold - 8:30 pm',
          text:
              'Stretch and fold every 45 minutes for the next two to three hours. The dough should be smooth and pass the window pane test.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 2,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Bulk Rise - 10:30 pm',
          text: 'The dough should now rest until it has risen by 50%.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 2,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Pre-Shape and Bench Rest - 12:30 am',
          text:
              'Once the bulk rise is finished, preshape your loaves carefully before allowing them to rest for around thirty minutes. ',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Final Shape and Proof - 01:00 am',
          text:
              'Shape the loaves and place them either in your proofing basket or baking tray. Put your loaves inside an airtight plastic- or ziplock bag and place them in the fridge to proof overnight.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Preheat Oven - 1:00 pm',
          text:
              'Preheat your oven for 45-60 minutes at 240°/500F. If you are baking the loaf inside a dutch oven, place it inside to heat up as well.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 12,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Baking - 2:00 pm',
          text:
              'Remove proofed loaves onto parchment paper or directly into the preheated dutch oven, score loaves then bake for 20 minutes with the lid on. Turn the oven down to 450, remove the lid on the dutch oven and continue bake for 20-30 minutes with lid off. Let the loaves cool completely before cutting.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 0,
            seconds: 0,
          )),
    ],
    'The Speedbake': [
      RecipeItemModel(
        title: 'Feed Starter - 10 pm',
        text:
            'Remove most of the starter leaving at least 2 Tbsp, then feed your starter with flour and ice cold water to slow down the activation process. Autolyse - mix the flour and water without kneading.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 9,
          minutes: 0,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Salt & Starter - 7:00 am',
        text:
            'Once the starter is fully activated, incorporate the starter and salt into the dough with the stretch and fold technique',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 30,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Stretch & Fold - 7:30 am',
        text:
            'Perform a stretch and fold round every 30 minutes for the next 2-2.5 hours until you feel the dough has developed a nice gluten structure.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 2,
          minutes: 0,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Bulk Rise - 9:30 pm',
        text:
            'Let the dough sit for the next few hours until it has risen by 30-50%',
        isDone: false,
        durationUntilNext: Duration(
          hours: 4,
          minutes: 30,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Pre-Shape - 2:00 pm',
        text:
            'Once you are satisfied with your bulk rise, remove the dough onto a floured surface and pre shape your loaves.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 30,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Bench Rest - 2:30 pm',
        text: 'Let the reshaped loaves bench rest for 30 minutes.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 30,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Shape & Proof - 3:00 pm',
        text:
            'Give your loaves a final shaping and place them in the proofing baskets.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 0,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Preheat Oven - 5:00 pm',
        text:
            'Place your dutch oven pan in the oven at 500 Degrees Fahrenheit and preheat for at least 45 minutes.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 2,
          minutes: 0,
          seconds: 0,
        ),
      ),
      RecipeItemModel(
        title: 'Baking - 5:00 pm',
        text:
            'Remove proofed loaves onto parchment paper or directly into the preheated dutch oven, score loaves then bake for 20 minutes with the lid on. Turn the oven down to 450, remove the lid on the dutch oven and continue bake for 20-30 minutes with lid off. Let the loaves cool completely before cutting.',
        isDone: false,
        durationUntilNext: Duration(
          hours: 0,
          minutes: 0,
          seconds: 0,
        ),
      ),
    ],
    'The 9-5 Bake': [
      RecipeItemModel(
          title: 'Feed Starter - 8 am',
          text:
              'Remove most of the starter leaving at least 2 Tbsp, then feed your starter with flour and ice cold water to slow down the activation process. Autolyse - mix the flour and water without kneading.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 7,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Salt & Starter - 5:00 pm',
          text:
              'Once the starter is fully activated, incorporate the starter and salt into the dough with the stretch and fold technique',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Stretch & Fold - 5:30 pm',
          text:
              'Perform a stretch and fold round every 30 minutes for the next 2-2.5 hours until you feel the dough has developed a nice gluten structure.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 2,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Bulk Rise - 7:30 pm',
          text:
              'Let the dough sit for the next few hours until it has risen by 30-50% this process depends on the variables* listed above so use your intuition!',
          isDone: false,
          durationUntilNext: Duration(
            hours: 2,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Pre-Shape and Bench Rest - 10:00 pm',
          text:
              'Once you are satisfied with your bulk rise, remove the dough onto a floured surface and pre shape your loaves. Let the reshaped loaves bench rest for 30 minutes.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Final Shape and Proof - 10:30 pm',
          text:
              ' Give your loaves a final shaping and place them in the baskets. Place your proofing baskets in a plastic bag (or plastic wrap) and put them the fridge to proof overnight.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 9,
            minutes: 30,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Preheat Oven - 7:00 am',
          text:
              'Preheat oven at 500 Degrees Fahrenheit / 240C and for at least 45 minutes. If you have a dutch oven, place it in the oven as well.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 1,
            minutes: 0,
            seconds: 0,
          )),
      RecipeItemModel(
          title: 'Baking - 8:00 am',
          text:
              'Remove proofed loaves onto parchment paper or directly into the preheated dutch oven, score loaves then bake for 20 minutes with the lid on. Turn the oven down to 450, remove the lid on the dutch oven and continue bake for 20-30 minutes with lid off. Let the loaves cool completely before cutting.',
          isDone: false,
          durationUntilNext: Duration(
            hours: 0,
            minutes: 0,
            seconds: 0,
          )),
    ]
  };
}
