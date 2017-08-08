> Used by two major courses at UC Berkeley, serving a cumulative total of ~3000 students across 3 semesters:
> 1. CS70 with 800+ students [[Fa'16](http://inst.eecs.berkeley.edu/~cs70/fa16/)][[Sp'17](http://inst.eecs.berkeley.edu/~cs70/sp17/)][[Fa'17](http://eecs70.org)]
> 2. CS189 with 500+ students [[Fa'17](http://eecs189.org)]

# Staging
This repository contains (1) the generator for the website and (2) the
staged website. The staging area can be found at the following link:
[staging.yourcourse.org](http://staging.yourcourse.org).

<img width="1364" alt="screen shot 2017-08-07 at 11 41 09 pm" src="https://user-images.githubusercontent.com/2068077/29059390-3102988c-7bca-11e7-940a-dece530e9631.png">

# Usage

To make edits to the website, first run the preview.

    make preview

Then, make edits as necessary. Once you feel comfortable
with the changes made, deploy to the staging area. Check
[staging.yourcourse.org](http://staging.yourcourse.org).

    make staging m="<message describing change>"

If the staging area matches your expectations, you may then deploy
directly to production. Run the following to publish to
[yourcourse.org](http://yourcourse.org).

    make deploy m="<message describing change>"

Your edits go live instantaneously.

## Usage Notes

You *must* stage before deployment, as `make staging` will save your
changes to this repository.

## Updating Staff Information

First, follow instructions in the
[Installation section](https://github.com/alvinwan/staging#installation)
below to get the repository setup. Once the repository has been setup,
launch the website preview.

    make preview

The website preview should open up in your browser. Navigate the staff
page, by clicking on the link in the header. Back in your
command-line prompt, edit `src/data/global/people.json` using `nano`
or your favorite text editor.

    nano src/data/global/people.json

In `people.json` add a new entry in your respective category,
`faculty`, `head_tas`, `tas`, or `readers`. Your entry should resemble
the following.

    {
      "name": "Satish Rao",
      "title": "Professor",
      "link": "http://ducksarethebest.com",
      "email": "superm@n.com",
      "office_hours": "W 9-11 am in Soda 651",
      "discussions": "T/Th 2-3 pm in Dwinelle 87",
      "image": "https://images.google.com/clark_kent_in_public.jpg"
    }

Upon saving, your browser's preview will automatically update. Check
that it matches your expectations. Then, use the following to deploy
to [staging.yourcourse.org](http://staging.yourcourse.org).

    make staging m="<message describing change>"

You are now finished! See the
[Usage section](https://github.com/alvinwan/staging#usage) for instructions
on deploying to production. **Do not deploy to production yet, as
production is currently just a placeholder.**

## Updating Website Material

First, follow instructions in the
[Installation section](https://github.com/alvinwan/staging#installation)
below to get the repository setup. Once the repository has been setup,
launch the website preview.

    make preview

The website preview should open up in your browser. Second, update the
resource -- see the [materials section](https://github.com/alvinwan/staging#website-material-formats-and-location)
for details on filename formats and where these materials are located.

Now that we've updated the material's resource, we would now like to
update the material's information in
`src/data/global/(discussions|homeworks|notes|slides).json`. Let us say
we are uploading new or modifying existing `notes`. Edit
`src/data/global/notes.json` using `nano` or your favorite text editor.

    nano src/data/global/notes.json

Upon saving, your browser's preview will automatically update. Check
that it matches your expectations.

> Time-sensitive resources - namely homework, slides, and discussions -
  are displayed on the website only if
  `current_week >= min(resource.weeks)`. For example, if the resource's
  `weeks` attribuet is `[2, 3]`, and `current_week` is `2`, then the
  resource is shown on the website. If the `current_week` is `1`, then
  the resource is hidden.

Then, use the following to deploy to
[staging.yourcourse.org](http://staging.yourcourse.org).

    make staging m="<message describing change>"

You are now finished! See the
[Usage section](https://github.com/alvinwan/staging#usage) for instructions
on deploying to production. **Do not deploy to production yet, as
production is currently just a placeholder.**

# Installation

First, clone this repository, and switch into the directory.

    git clone git@github.com:CS189/staging.git
    cd staging

Second, install Python dependencies. (It is recommended that you do this in a virtual environment.)

    pip install -r requirements.txt

# File Structure

(coming soon)

## Website Material Formats and Location

All website materials have a specific format. This can easily be changed
in `src/html/index.html` and `src/html/resources`. Here are the
respective default formats:

- Notes: `n{number}.pdf` (e.g. `n1.pdf`, `n12.pdf`)
- Discussions: `dis{number}{section}.pdf`, where `number` is 0-padded and `section` is `a` or `b` (e.g., `dis01a.pdf`, `dis12b.pdf`)
- Homeworks: `hw{number}.pdf`, where `number` is 0-padded
- Slides: `lec-{number}-{format}.pdf` where `format` is `handout` or `6up` (e.g., `lec-1-handout.pdf`, `lec-12-6up.pdf`)

All materials can be found under `src/static/`.
